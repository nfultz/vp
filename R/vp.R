

#' Odds from https://www.casinocenter.com/video-poker-probability/
hands <- transform(
  data.frame(
    occurs_every = c(
      "Royal Flush" = 40390.55,
      "Straight Flush" = 9148.37,
      #"Four of a Kind" = 423.27,
      "AAAA" = 423.27 * 13,
      "KKKK" = 423.27 * 13,
      "QQQQ" = 423.27 * 13,
      "JJJJ" = 423.27 * 13,
      "0000" = 423.27 * 13,
      "9999" = 423.27 * 13,
      "8888" = 423.27 * 13,
      "7777" = 423.27 * 13,
      "6666" = 423.27 * 13,
      "5555" = 423.27 * 13,
      "4444" = 423.27 * 13,
      "3333" = 423.27 * 13,
      "2222" = 423.27 * 13,
      "Full House" = 86.86,
      "Flush" = 90.79,
      "Straight" = 89.05,
      #"Three of a Kind" = 13.43,
      "AAA" = 13.43 * 13,
      "KKK" = 13.43 * 13,
      "QQQ" = 13.43 * 13,
      "JJJ" = 13.43 * 13,
      "000" = 13.43 * 13,
      "999" = 13.43 * 13,
      "888" = 13.43 * 13,
      "777" = 13.43 * 13,
      "666" = 13.43 * 13,
      "555" = 13.43 * 13,
      "444" = 13.43 * 13,
      "333" = 13.43 * 13,
      "222" = 13.43 * 13,
      
      "Two Pair" = 7.74,
      #"Pair of JQKA" = 4.66,
      "AA" = 4.66*4,
      "KK" = 4.66*4,
      "QQ" = 4.66*4,
      "JJ" = 4.66*4,
      " " = 1.83
    )
  ),
  threshold = cumsum(1/occurs_every) - 1/occurs_every
)

poker.pval <- function(p.value, ...) {
  rownames(hands)[findInterval(p.value, hands$threshold)]
}

toggle_stars_poker <- function() {
  b <- baseenv()
  unlockBinding("format.pval", b)
  options(show.signif.stars = FALSE)
  b$format.pval <- poker.pval
  lockBinding("format.pval", b)
}
