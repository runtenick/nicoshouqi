import model

let piece = Piece(owner: .player1, animal: .rat)
print(piece)


let cell = Cell(cellType: .den, initialOwner: .player1, piece: piece )
print(cell)
