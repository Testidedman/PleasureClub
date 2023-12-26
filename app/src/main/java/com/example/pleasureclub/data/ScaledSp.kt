package com.example.pleasureclub.data

import androidx.compose.runtime.Composable
import androidx.compose.ui.platform.LocalDensity
import androidx.compose.ui.unit.TextUnit
import androidx.compose.ui.unit.sp

@Composable
fun Int.scaledSp(): TextUnit {
    val value: Int = this
    return with(LocalDensity.current) {
        val fontScale = this.fontScale
        val textSize = value / fontScale
        textSize.sp
    }
}

val Int.scaledSp: TextUnit
    @Composable get() = scaledSp()

@Composable
fun Double.scaledSp(): TextUnit {
    val value: Double = this
    return with(LocalDensity.current) {
        val fontScale = this.fontScale
        val textSize = value / fontScale
        textSize.sp
    }
}

val Double.scaledSp: TextUnit
    @Composable get() = scaledSp()