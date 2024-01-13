//
//  main.swift
//  cli-doshou
//
//  Created by étudiant on 10/01/2024.
//

import Models
import ModelExtensionEmoji

// pieces

// player 1
let rat1 = Piece(owner: .player1, animal: .rat)
let cat1 = Piece(owner: .player1, animal: .cat)
let dog1 = Piece(owner: .player1, animal: .dog)
let wolf1 = Piece(owner: .player1, animal: .wolf)
let leopard1 = Piece(owner: .player1, animal: .leopard)
let tiger1 = Piece(owner: .player1, animal: .tiger)
let lion1 = Piece(owner: .player1, animal: .lion)
let elephant1 = Piece(owner: .player1, animal: .elephant)

// player 2
let rat2 = Piece(owner: .player2, animal: .rat)
let cat2 = Piece(owner: .player2, animal: .cat)
let dog2 = Piece(owner: .player2, animal: .dog)
let wolf2 = Piece(owner: .player2, animal: .wolf)
let leopard2 = Piece(owner: .player2, animal: .leopard)
let tiger2 = Piece(owner: .player2, animal: .tiger)
let lion2 = Piece(owner: .player2, animal: .lion)
let elephant2 = Piece(owner: .player2, animal: .elephant)

// Board Cells
var cell00 = Cell(cellType: .jungle, piece: lion1)
var cell01 = Cell(cellType: .jungle)
var cell02 = Cell(cellType: .trap)
var cell03 = Cell(cellType: .den)
var cell04 = Cell(cellType: .trap)
var cell05 = Cell(cellType: .jungle)
var cell06 = Cell(cellType: .jungle, piece: tiger1)
let row1 = [cell00, cell01, cell02, cell03, cell04, cell05, cell06]

var cell10 = Cell(cellType: .jungle)
var cell11 = Cell(cellType: .jungle, piece: dog1)
var cell12 = Cell(cellType: .jungle)
var cell13 = Cell(cellType: .trap)
var cell14 = Cell(cellType: .jungle)
var cell15 = Cell(cellType: .jungle, piece: cat1)
var cell16 = Cell(cellType: .jungle)
let row2 = [cell10, cell11, cell12, cell13, cell14, cell15, cell16]


var cell20 = Cell(cellType: .jungle, piece: rat1)
var cell21 = Cell(cellType: .jungle)
var cell22 = Cell(cellType: .jungle, piece: leopard1)
var cell23 = Cell(cellType: .jungle)
var cell24 = Cell(cellType: .jungle, piece: wolf1)
var cell25 = Cell(cellType: .jungle)
var cell26 = Cell(cellType: .jungle, piece: elephant1)
let row3 = [cell20, cell21, cell22, cell23, cell24, cell25, cell26]


var cell30 = Cell(cellType: .jungle)
var cell31 = Cell(cellType: .water)
var cell32 = Cell(cellType: .water)
var cell33 = Cell(cellType: .jungle)
var cell34 = Cell(cellType: .water)
var cell35 = Cell(cellType: .water)
var cell36 = Cell(cellType: .jungle)
let row4 = [cell30, cell31, cell32, cell33, cell34, cell35, cell36]


var cell40 = Cell(cellType: .jungle)
var cell41 = Cell(cellType: .water)
var cell42 = Cell(cellType: .water)
var cell43 = Cell(cellType: .jungle)
var cell44 = Cell(cellType: .water)
var cell45 = Cell(cellType: .water)
var cell46 = Cell(cellType: .jungle)
let row5 = [cell40, cell41, cell42, cell43, cell44, cell45, cell46]


var cell50 = Cell(cellType: .jungle)
var cell51 = Cell(cellType: .water)
var cell52 = Cell(cellType: .water)
var cell53 = Cell(cellType: .jungle)
var cell54 = Cell(cellType: .water)
var cell55 = Cell(cellType: .water)
var cell56 = Cell(cellType: .jungle)
let row6 = [cell50, cell51, cell52, cell53, cell54, cell55, cell56]


var cell60 = Cell(cellType: .jungle)
var cell61 = Cell(cellType: .water)
var cell62 = Cell(cellType: .water)
var cell63 = Cell(cellType: .jungle)
var cell64 = Cell(cellType: .water)
var cell65 = Cell(cellType: .water)
var cell66 = Cell(cellType: .jungle)
let row7 = [cell60, cell61, cell62, cell63, cell64, cell65, cell66]


var cell70 = Cell(cellType: .jungle, piece: elephant2)
var cell71 = Cell(cellType: .jungle)
var cell72 = Cell(cellType: .jungle, piece: wolf2)
var cell73 = Cell(cellType: .jungle)
var cell74 = Cell(cellType: .jungle, piece: leopard2)
var cell75 = Cell(cellType: .jungle)
var cell76 = Cell(cellType: .jungle, piece: rat2)
let row8 = [cell70, cell71, cell72, cell73, cell74, cell75, cell76]


var cell80 = Cell(cellType: .jungle)
var cell81 = Cell(cellType: .jungle, piece: cat2)
var cell82 = Cell(cellType: .jungle)
var cell83 = Cell(cellType: .trap)
var cell84 = Cell(cellType: .jungle)
var cell85 = Cell(cellType: .jungle, piece: dog2)
var cell86 = Cell(cellType: .jungle)
let row9 = [cell80, cell81, cell82, cell83, cell84, cell85, cell86]


var cell90 = Cell(cellType: .jungle, piece: tiger2)
var cell91 = Cell(cellType: .jungle)
var cell92 = Cell(cellType: .trap)
var cell93 = Cell(cellType: .den)
var cell94 = Cell(cellType: .trap)
var cell95 = Cell(cellType: .jungle)
var cell96 = Cell(cellType: .jungle, piece: lion2)
let row10 = [cell90, cell91, cell92, cell93, cell94, cell95, cell96]

let grid = [row1, row2, row3, row4, row5, row6, row7, row8, row9, row10]

let board = Board(grid: grid)
if let bboard = board {
    print(bboard.classique);
}

