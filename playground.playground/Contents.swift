/*

let piece = Piece(owner: .player1, animal: .rat)
print(piece)


let cell = Cell(cellType: .den, initialOwner: .player1, piece: piece )
print(cell)


public extension CellType {
    var symbol: String {
        switch self {
        case .unknown:
            return " "
        case .jungle:
            return "🌿"
        case .den:
            return "🪹"
        case .trap:
            return "🪤"
        case .water:
            return "💧"
        }
    }
}

let cellType = CellType.water
print(cellType.symbol)

public extension Animal {
    var symbol: String {
        switch self {
            case .rat: return "🐭"
            case .cat: return "🐱"
            case .dog: return "🐶"
            case .wolf: return "🐺"
            case .leopard: return "🐆"
            case .tiger: return "🐯"
            case .lion: return "🦁"
            case .elephant: return "🐘"
        }
    }
}

let animal = Animal.cat
print(animal.symbol)

*/
