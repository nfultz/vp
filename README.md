---
title: "README"
author: "Neal Fultz"
date: "5/20/2020"
output: html_document
---

## vp

The vp package converts p-values to video poker hands and overrides the default R output for regression models.

I am giving up on lecturing my clients on p values :(

### Example


```r
vp::toggle_stars_poker()
summary(lm(extra~group, sleep))
```

```
## 
## Call:
## lm(formula = extra ~ group, data = sleep)
## 
## Residuals:
##    Min     1Q Median     3Q    Max 
## -2.430 -1.305 -0.580  1.455  3.170 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)
## (Intercept) 0.750000   0.600398 1.24917 Two Pair
## group2      1.580000   0.849091 1.86081      777
## 
## Residual standard error: 1.898625 on 18 degrees of freedom
## Multiple R-squared:  0.1613329,	Adjusted R-squared:  0.1147402 
## F-statistic: 3.462627 on 1 and 18 DF,  p-value: 777
```

### Notes

Tens are coded as `0`, so a hand of `0000` is four tens, which beats `AAA` but loses to `QQQQ`.

