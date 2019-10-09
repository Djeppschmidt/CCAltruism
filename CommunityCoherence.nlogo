extensions [ table ]

globals [
 altruist-wealth
 miser-wealth
 cohesion
 cohesion-success
 total-closures
 Mwealth
 Failures
]

breed [altruists altruist] ;; always shares some portion of harvest
breed [misers miser]       ;; never shares any portion of harvest
breed [habitat ahabitat]  ;; make habitat breed for turtle - important as this turtle will not move
;breed [friendly a-friendly]  ;; higher threshold to share (20)
;breed [Vfriendly a-Vfriendly]  ;; Lower threshold to share (10)

turtles-own [
  Harvest           ;; the amount of harvest this turtle has
  Waste             ;; amount of wasted harvest each turtle has
  Demand            ;; metabolic demand of turtle, representing number in family unit
  Hunger            ;; difference between demand and harvest this round
  Vision            ;; radius of vision
  tshare            ;; amount to share
  ;age               ;; age of the turtle
  ;; the amount of harvest that each turtle uses during each tick and how far they can see
]

patches-own [
  quality            ;; sets the quality of the patch at the begining
  max-resource       ;; sets the maximum possible resource for this particular patch
  resource           ;; the amount of resource on this patch - use slider to set mean
  closureCondition   ;; logical, whether patch triggers closure of whole management area
]

directed-link-breed [knowledge a-knowledge]
directed-link-breed [foods food]
directed-link-breed [memory amemory]

links-own [
  time
  ;my-habitat
]

memory-own [
  val
]

;;
;;
;; Setup / simple version
;;
;;


to setup
  clear-all
  set total-closures 0
  set Failures 0
  ;set Mwealth mean [Harvest] of turtles
  setup-patches
  setup-turtles
  set-default-shape turtles "person"
  set-default-shape habitat "line"
  reset-ticks
end

to setup-turtles
  create-altruists altruist-number
  ask altruists [set color blue]
  create-misers miser-number
  ask misers [set color red]
  ;create-friendly friendly-number
  ;ask friendly [set color (blue + 2)]
  ;create-Vfriendly Vfriendly-number
  ;ask Vfriendly [set color (blue + 1)]
  ask (turtle-set altruists misers) [
      set Harvest random 20
      set Demand random 5
      set Waste 0
      ;set age random 100
      setxy random-pxcor random-pycor]
  ask (turtle-set altruists misers) [
    repeat 5 [
      ;let impossible-h (patches in-radius 3 with [any? misers or any? altruists])
      move-to one-of habitat
      let v [Resource] of patch-here
      create-memory-to habitat-here [set val v
      set time 12
        set color yellow]]]
end

;let move-candidates (patch-set patch-here (patches at-points vision-points) with [not any? turtles-here])
;  let possible-winners move-candidates with-max [psugar]
;  if any? possible-winners [
    ;; if there are any such patches move to one of the patches that is closest
;    move-to min-one-of possible-winners [distance myself]

to setup-patches
  ask patches[
   ; set quality random
  set quality random 20
  set resource random-poisson resource-abundance + quality
  set closureCondition random-poisson 0.000001
  set pcolor (green + resource)
  set max-resource (quality * 10)
    sprout-habitat 1 [set color grey]
  ]
end
;;set pcolor (yellow + 4.9 - psugar)
;; Runtime Procedures
;;

to go
  ask patches[
  patch-grow
  patch-manage
  ]
  ask patches [set pcolor (green + resource)]

  ask (turtle-set misers altruists) [
  ;turtle-eat
  turtle-explore
  turtle-Harvest
  ;;turtle-move
  turtle-share
  ]

  ask links [
    if time = 0 [die]
    set time (time - 1)]
  ;set altruist-wealth mean [Harvest] of altruists
  ;set miser-wealth mean [Harvest] of misers
  ;set cohesion count links
  ;set Mwealth mean [Harvest] of turtles
  if any? (turtle-set altruists misers) with [ Harvest <= 0 ] [set Failures (Failures + 1)]
  show min [Harvest] of (turtle-set altruists misers)
  tick
end
 ; write this one to account for memory sharing ...
;to turtle-move ;; identify highest resource value
;   set Vision (2 * Demand - Hardship)
;  if Vision < 1 [set Vision 0]
;  let possible-harvest ( patches in-radius Vision ) with [not any? turtles-here]
;   ;move-to max-one-of patches in-radius Vision [Resource]
;  if any? possible-harvest [move-to max-one-of possible-harvest [Resource]]
;  set Harvest (Harvest + Resource)
;end

to turtle-eat
  set Harvest (Harvest - (Demand * 0.5))
  if Harvest < 0 [set Harvest 0]
end

to turtle-explore
   set Vision (2 * Demand - Hardship)
  if Vision < 1 [set Vision 0]
  if Vision > 0 [
    let possible-harvest ( habitat in-radius Vision ) with [not any? misers-here or not any? altruists-here]
    repeat (Vision + 1) [
      if any? possible-harvest [move-to one-of possible-harvest ]
      let v [Resource] of patch-here
      ;let mh [who] of habitat-here
      ;print [who] of habitat-here
      ask self [create-memory-to habitat-here [set val v
        set time 12
        set color yellow
        ;set my-habitat mh
      ]
    ]]
    if any? my-memory [
      let g reverse sort-on [val] my-out-memory
      let t 0
      while [(count turtles-here) > 2] [
        let h item t g
        let hnot [end2] of h
        move-to hnot
        set t (t + 1)

  ]]]
  if Vision = 0 [
  let possible-harvest habitat with [not any? misers-here or not any? altruists-here]
    let n habitat-here
    repeat 2 [
      if any? possible-harvest [move-to one-of possible-harvest ]
      let v [Resource] of patch-here
      ask self [create-memory-to habitat-here [set val v
        set time 12
        set color yellow
      ]]]
  move-to one-of n
  ]

end

to turtle-harvest
  set Harvest (Harvest + Resource)
end
; asks all agents who are going to give, to donate to the least wealthy members of the community.
;The number of people and proportion they donate depends on sliders
to turtle-share
  let donors altruists
  ask donors [
    set tshare ( Shared * Harvest )
    let recipients other min-n-of connect-number (turtle-set misers altruists) [Harvest];
    let given tshare
    if Harvest > Max.Resource [set given (tshare + (Harvest - Max.Resource))]
    create-foods-to recipients
    ask foods [set time 12]
    ask recipients [set Harvest (Harvest + (given / count recipients))]
    set Harvest (Harvest - given)
   ask recipients[
    if any? my-memory [
    let g max-one-of my-out-memory [val]
    let h [end2] of g
    let v [val] of g
    ask myself [create-amemory-to h [set val v set time 12 set color yellow]]
    ;ask recipients [create-amemory-to h [set val v set time 48 set color yellow]]
  ]]
  ]
  turtle-eat
  ask (turtle-set altruists misers) [if harvest > Max.Resource [ set Waste (Waste + harvest - Max.Resource)
  set harvest Max.Resource]]
end

to patch-grow
;set resource random-poisson resource-abundance
;set resource random-poisson (resource-abundance + quality)
 ; if resource > max-resource [set resource max-resource]
set closureCondition random-poisson (0.0001 + (0.001 * hardship))

end

to patch-manage
  ifelse any? patches with [closureCondition != 0]
  [set resource 0
  set total-closures (total-closures + 1)];; if there are any closers, all patches are 0
  [set resource random-poisson (resource-abundance + quality)
  if resource > max-resource [set resource max-resource]]
  ;;make slider for resource abundance

end
@#$#@#$#@
GRAPHICS-WINDOW
210
10
647
448
-1
-1
13.0
1
10
1
1
1
0
1
1
1
-16
16
-16
16
0
0
1
ticks
30.0

SLIDER
655
10
827
43
altruist-number
altruist-number
0
75
15.0
1
1
NIL
HORIZONTAL

SLIDER
655
92
827
125
Shared
Shared
0
1
0.33
0.01
1
NIL
HORIZONTAL

SLIDER
655
132
827
165
hardship
hardship
0
5
1.656
0.001
1
NIL
HORIZONTAL

SLIDER
655
168
828
201
resource-abundance
resource-abundance
0
10
2.0
1
1
NIL
HORIZONTAL

BUTTON
835
10
955
78
NIL
setup
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
835
85
955
156
NIL
go
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
0

SLIDER
655
50
827
83
miser-number
miser-number
0
75
10.0
1
1
NIL
HORIZONTAL

PLOT
1
10
201
160
Harvest of altruists and misers
Time
Mean Harvest
0.0
30.0
0.0
10.0
true
false
"" ""
PENS
"pen-1" 1.0 0 -13791810 true "" "plot mean [Harvest] of altruists"
"pen-2" 1.0 0 -2139308 true "" "plot mean [Harvest] of misers"

SLIDER
656
206
828
239
Max.Resource
Max.Resource
0
100
52.0
1
1
NIL
HORIZONTAL

SLIDER
655
249
827
282
connect-number
connect-number
0
10
3.0
1
1
NIL
HORIZONTAL

PLOT
2
332
202
482
Total Connections
NIL
NIL
0.0
10.0
0.0
10.0
true
false
"" ""
PENS
"pen-1" 1.0 0 -7500403 true "" "plot count foods"

MONITOR
216
450
289
495
total ticks
ticks
17
1
11

BUTTON
837
165
954
222
Go once
go
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

PLOT
4
170
204
320
Failures
NIL
NIL
0.0
10.0
0.0
10.0
true
false
"" ""
PENS
"default" 1.0 0 -2674135 true "" "plot Failures"

PLOT
651
291
851
441
waste
NIL
NIL
0.0
10.0
0.0
10.0
true
false
"" ""
PENS
"default" 1.0 0 -16777216 true "" "plot sum [waste] of (turtle-set altruists misers)"

@#$#@#$#@
## WHAT IS IT?

This model looks at how resource scarcity affects community cohesion in subsistence communities. We are primarily interested in two metrics: the number of connections among members, and whether the entire community is fed. The links between community members is taken as a proxy for community cohesion in this case, and any one agent being hungry at the end of the round is considered a community failure. For this particular model, we have created only two modes of behavior for the turtles (or agents)- one that shares their harvest freely, and one that does not share at all. The ratio of these actors can be varied, as can the strenuousness of the environment. The environment itself is modeled after a shellfish fishery, with generally abundant harvest but closure conditions for the fishery. We expect that there will be greater incidence of the algae that cause toxic shellfish poisoning as temperatures become warmer. Thus, as the environment becomes harsher, the availability of harvest is mostly limited by fishery closures as blooms become more likely.

## HOW IT WORKS

The agents are each assigned a Demand value at random during the setup routine. The radius around each agent that they can explore (or vision) is 2*demand-hardship, so that the environmental hardship decreases the ability of all agents to explore their environment. Each round, the agents first explore 4 new locations within their vision radius. They choose a location to harvest based on their memory of the available resource in each location. Once they have chosen, the patches reset their resource value. Some patches are inherently ore likley to produce than others; this is determined in the patch setup phase. Thus, the agents may infer future productivity at a patch based on their past memory. 

## HOW TO USE IT

Buttons
Setup: initializes the model
Go (repeat): starts the model running indefinitely
Go (once): runs the model for one tick

Sliders
Altruist_number: sets number of altruists during initialization (community members that share)
Miser_number: sets number of misers during initialization (community members that do not share)
Shared: 
Hardship: Sets a penalty that affects the agent's ability to move; also sets the likelihood that there is a closure of the fishery in any given tick.
Resource_abundance: Determines the overall probability that any patch has harvestable resource; each patch is assigned it's own quality index that modifies this so that not all patches are equal
Max.Resource: Sets the maximum Harvest that any individual can hold
Connect-Number: Sets the number of agents each round that an altruist will share with.

First decide the composition of your community- how many altruists and misers will you have? If you have a new behavior, code it in and give it a slider so you can add it to the model. We recommend that the total community has no more than 50 people for processing speed considerations. Then decide where you want to set the environmental parameters. These can be changed in the middle of the run to explore behavior under different prevailing environmental conditions. Then hit "setup" and "go." 

The resource availability at any site is defined by a random selection in a poisson distribution with the mean value of (resource-abundance + quality), where resource-abundance is set by the user with a slider, and quality is a randomly assigned value between 1-20. The latter is hardcoded in, but can be changed if a specific variation is desired. 

Similarly, the amount of resources and likelihood of a closure are distributions that are hard-coded, but can be changed to fit the objective of the study.

The hardship slider can be used to approximate the probability that a substantial negative even takes place. In this model, recovery of the resource availability and the agent's capacity to harvest happen instantaneously. This could be changed also to fit the particular needs of the project.

## THINGS TO NOTICE


## THINGS TO TRY

Try moving the resource abundance slider up and down and finding a spot where the maximum resource value is reached. Then take the hardship slider and raise it in increments. Do this again several times, with communities of only misers or only altruists. What happens to the failure rate?

## EXTENDING THE MODEL

We hope that one of the outcomes of using this model is that communities can explore specific cultural practices to understand how they may impact the resilience of the group given increased scarcity with climate change. So we encourage using personalized behavior models for the individuals; or extending the model to include other group behaviors (like patch sharing, or subgrouping) that might alter the outcome of the community in general.

## NETLOGO FEATURES

For this discussion, we'll use "member" to refer to turtle agents that are either in the miser or altruist breed. 

Netlogo does not have sufficient data handling infrastructure to easily allow for agents to store and easily reference tables with multiple columns that represent the member's living memory. Even the table function is only effectly a named vector. But it is really important for our model that our agents have a living memory, and critically, that they can share it with other agents. To get around this we used links to represent a community member's memory of a particular patch. Of course, within Netlogo you can't have a link between a turtle and a patch, so we generate a stationary turtle of breed "Habitat" representing each patch. In the member's memory, links are directed from the member to the habitat, so referencing the habitat can be hard-coded as [end2]. We also use this designation to allow the member to move to any patch it remembers by using the move-to function and referencing the habitat agent that represents the patch in the member's memory.

## RELATED MODELS

(models in the NetLogo Models Library and elsewhere which are of related interest)

## CREDITS AND REFERENCES

(a reference to the model's URL on the web if it has one, as well as any other necessary credits, citations, and links)
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

box
false
0
Polygon -7500403 true true 150 285 285 225 285 75 150 135
Polygon -7500403 true true 150 135 15 75 150 15 285 75
Polygon -7500403 true true 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75

bug
true
0
Circle -7500403 true true 96 182 108
Circle -7500403 true true 110 127 80
Circle -7500403 true true 110 75 80
Line -7500403 true 150 100 80 30
Line -7500403 true 150 100 220 30

butterfly
true
0
Polygon -7500403 true true 150 165 209 199 225 225 225 255 195 270 165 255 150 240
Polygon -7500403 true true 150 165 89 198 75 225 75 255 105 270 135 255 150 240
Polygon -7500403 true true 139 148 100 105 55 90 25 90 10 105 10 135 25 180 40 195 85 194 139 163
Polygon -7500403 true true 162 150 200 105 245 90 275 90 290 105 290 135 275 180 260 195 215 195 162 165
Polygon -16777216 true false 150 255 135 225 120 150 135 120 150 105 165 120 180 150 165 225
Circle -16777216 true false 135 90 30
Line -16777216 false 150 105 195 60
Line -16777216 false 150 105 105 60

car
false
0
Polygon -7500403 true true 300 180 279 164 261 144 240 135 226 132 213 106 203 84 185 63 159 50 135 50 75 60 0 150 0 165 0 225 300 225 300 180
Circle -16777216 true false 180 180 90
Circle -16777216 true false 30 180 90
Polygon -16777216 true false 162 80 132 78 134 135 209 135 194 105 189 96 180 89
Circle -7500403 true true 47 195 58
Circle -7500403 true true 195 195 58

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

cylinder
false
0
Circle -7500403 true true 0 0 300

dot
false
0
Circle -7500403 true true 90 90 120

face happy
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 255 90 239 62 213 47 191 67 179 90 203 109 218 150 225 192 218 210 203 227 181 251 194 236 217 212 240

face neutral
false
0
Circle -7500403 true true 8 7 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Rectangle -16777216 true false 60 195 240 225

face sad
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 168 90 184 62 210 47 232 67 244 90 220 109 205 150 198 192 205 210 220 227 242 251 229 236 206 212 183

fish
false
0
Polygon -1 true false 44 131 21 87 15 86 0 120 15 150 0 180 13 214 20 212 45 166
Polygon -1 true false 135 195 119 235 95 218 76 210 46 204 60 165
Polygon -1 true false 75 45 83 77 71 103 86 114 166 78 135 60
Polygon -7500403 true true 30 136 151 77 226 81 280 119 292 146 292 160 287 170 270 195 195 210 151 212 30 166
Circle -16777216 true false 215 106 30

flag
false
0
Rectangle -7500403 true true 60 15 75 300
Polygon -7500403 true true 90 150 270 90 90 30
Line -7500403 true 75 135 90 135
Line -7500403 true 75 45 90 45

flower
false
0
Polygon -10899396 true false 135 120 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 85 132 38
Circle -7500403 true true 130 147 38
Circle -7500403 true true 192 85 38
Circle -7500403 true true 85 40 38
Circle -7500403 true true 177 40 38
Circle -7500403 true true 177 132 38
Circle -7500403 true true 70 85 38
Circle -7500403 true true 130 25 38
Circle -7500403 true true 96 51 108
Circle -16777216 true false 113 68 74
Polygon -10899396 true false 189 233 219 188 249 173 279 188 234 218
Polygon -10899396 true false 180 255 150 210 105 210 75 240 135 240

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -16777216 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120
Line -16777216 false 30 120 270 120

leaf
false
0
Polygon -7500403 true true 150 210 135 195 120 210 60 210 30 195 60 180 60 165 15 135 30 120 15 105 40 104 45 90 60 90 90 105 105 120 120 120 105 60 120 60 135 30 150 15 165 30 180 60 195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 240 210 180 210 165 195
Polygon -7500403 true true 135 195 135 240 120 255 105 255 105 285 135 285 165 240 165 195

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

person
false
0
Circle -7500403 true true 110 5 80
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 195 90 240 150 225 180 165 105
Polygon -7500403 true true 105 90 60 150 75 180 135 105

plant
false
0
Rectangle -7500403 true true 135 90 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 180 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 105 90 60 45 45 75 105 135 135
Polygon -7500403 true true 165 105 165 135 225 105 255 45 210 60
Polygon -7500403 true true 135 90 120 45 150 15 180 45 165 90

sheep
false
15
Circle -1 true true 203 65 88
Circle -1 true true 70 65 162
Circle -1 true true 150 105 120
Polygon -7500403 true false 218 120 240 165 255 165 278 120
Circle -7500403 true false 214 72 67
Rectangle -1 true true 164 223 179 298
Polygon -1 true true 45 285 30 285 30 240 15 195 45 210
Circle -1 true true 3 83 150
Rectangle -1 true true 65 221 80 296
Polygon -1 true true 195 285 210 285 210 240 240 210 195 210
Polygon -7500403 true false 276 85 285 105 302 99 294 83
Polygon -7500403 true false 219 85 210 105 193 99 201 83

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

triangle
false
0
Polygon -7500403 true true 150 30 15 255 285 255

triangle 2
false
0
Polygon -7500403 true true 150 30 15 255 285 255
Polygon -16777216 true false 151 99 225 223 75 224

truck
false
0
Rectangle -7500403 true true 4 45 195 187
Polygon -7500403 true true 296 193 296 150 259 134 244 104 208 104 207 194
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Rectangle -7500403 true true 181 185 214 194
Circle -16777216 true false 144 174 42
Circle -16777216 true false 24 174 42
Circle -7500403 false true 24 174 42
Circle -7500403 false true 144 174 42
Circle -7500403 false true 234 174 42

turtle
true
0
Polygon -10899396 true false 215 204 240 233 246 254 228 266 215 252 193 210
Polygon -10899396 true false 195 90 225 75 245 75 260 89 269 108 261 124 240 105 225 105 210 105
Polygon -10899396 true false 105 90 75 75 55 75 40 89 31 108 39 124 60 105 75 105 90 105
Polygon -10899396 true false 132 85 134 64 107 51 108 17 150 2 192 18 192 52 169 65 172 87
Polygon -10899396 true false 85 204 60 233 54 254 72 266 85 252 107 210
Polygon -7500403 true true 119 75 179 75 209 101 224 135 220 225 175 261 128 261 81 224 74 135 88 99

wheel
false
0
Circle -7500403 true true 3 3 294
Circle -16777216 true false 30 30 240
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -7500403 true 216 40 79 269
Line -7500403 true 40 84 269 221
Line -7500403 true 40 216 269 79
Line -7500403 true 84 40 221 269

wolf
false
0
Polygon -16777216 true false 253 133 245 131 245 133
Polygon -7500403 true true 2 194 13 197 30 191 38 193 38 205 20 226 20 257 27 265 38 266 40 260 31 253 31 230 60 206 68 198 75 209 66 228 65 243 82 261 84 268 100 267 103 261 77 239 79 231 100 207 98 196 119 201 143 202 160 195 166 210 172 213 173 238 167 251 160 248 154 265 169 264 178 247 186 240 198 260 200 271 217 271 219 262 207 258 195 230 192 198 210 184 227 164 242 144 259 145 284 151 277 141 293 140 299 134 297 127 273 119 270 105
Polygon -7500403 true true -1 195 14 180 36 166 40 153 53 140 82 131 134 133 159 126 188 115 227 108 236 102 238 98 268 86 269 92 281 87 269 103 269 113

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270
@#$#@#$#@
NetLogo 6.1.0
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
default
0.0
-0.2 0 0.0 1.0
0.0 1 1.0 0.0
0.2 0 0.0 1.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180
@#$#@#$#@
0
@#$#@#$#@
