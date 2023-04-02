displayBoard <- function(board) {
  for (x in 1:3) {
    cat(board[[x]], sep = "  ")
    cat("\n")
  }
}

isValidMove <- function(board, row, col) {
  if (is.na(row) || is.na(col)) {
    return(FALSE)
  } # Verify type
  if (row < 1 || col < 1 || row > 3 || col > 3) {
    return(FALSE)
  } # Verify coordinate is on board
  if (board[[row]][col] != "-") {
    return(FALSE)
  } # Verify coordinate is available
  return(TRUE)
}

# Computer chooses most immediately available coordinate traversing by row
getComputerMove <- function(board) {
  for (x in 1:3) {
    for (y in 1:3) {
      if (board[[x]][y] == "-") {
        return(c(x, y))
      }
    }
  }
}

# Victory check is done with respect to the most recent move in order to run in O(n)
# in retrospect, this is not a big deal given that game is only 3x3
isWinState <- function(board, move, symbol) {
  # Check for row victory
  isRowVictory <- TRUE
  for (x in 1:3) {
    if (board[[move[1]]][x] != symbol) isRowVictory <- FALSE
  }
  if (isRowVictory) {
    return(TRUE)
  }

  # Check for column victory
  isColumnVictory <- TRUE
  for (x in 1:3) {
    if (board[[x]][move[2]] != symbol) isColumnVictory <- FALSE
  }
  if (isColumnVictory) {
    return(TRUE)
  }

  # Check for victory along y = x diagonal
  if (move[1] == move[2]) {
    isDiagVictory <- TRUE
    for (x in 1:3) {
      if (board[[x]][x] != symbol) isDiagVictory <- FALSE
    }
    if (isDiagVictory) {
      return(TRUE)
    }
  }

  # Check for victory along y = -x diagonal
  if (move[1] == move[2] || (move[1] == 1 && move[2] == 3) || (move[1] == 3 && move[2] == 1)) {
    isDiagVictory <- TRUE
    for (x in 1:3) {
      if (board[[x]][4 - x] != symbol) isDiagVictory <- FALSE
    }
    if (isDiagVictory) {
      return(TRUE)
    }
  }
  return(FALSE)
}

row <- c("-", "-", "-")
board <- list(row, row, row)
numMoves <- 0
currPlayer <- "X"
if (interactive()) {
  con <- stdin()
} else {
  con <- "stdin"
}
cat("X or O? ")
player <- readLines(con = con, n = 1)
while (numMoves < 9) {
  if (player == currPlayer) {
    cat(paste("Round Number", as.character((numMoves / 2) + 1), "\n", sep = " "))
    displayBoard(board)
    while (TRUE) {
      cat("What row? ")
      row <- as.numeric(readLines(con = con, n = 1))
      cat("What column? ")
      col <- as.numeric(readLines(con = con, n = 1))
      if (isValidMove(board, row, col)) break
      print("The chosen coordinate is either occupied or off the board.  Try again.")
    }
    move <- c(row, col)
  } else {
    move <- getComputerMove(board)
  }
  board[[move[1]]][move[2]] <- currPlayer
  victory <- isWinState(board, move, currPlayer)
  if (victory) break
  if (currPlayer == "X") currPlayer <- "O" else currPlayer <- "X"
  numMoves <- numMoves + 1
}
cat("Game finished!\n")
displayBoard(board)
if (victory) {
  cat(paste("Player", currPlayer, "wins!", sep = " "))
} else {
  print("The game ended in stalemate.")
}
