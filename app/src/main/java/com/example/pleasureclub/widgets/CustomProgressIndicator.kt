package com.example.pleasureclub.widgets


import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.LinearProgressIndicator
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp

@Composable
fun CustomProgressIndicator(currentProgress: Float) {
    LinearProgressIndicator(
        modifier = Modifier.padding(horizontal = 0.61.dp).clip(RoundedCornerShape(100.dp)),
        progress = currentProgress,
        color = Color(0xffFF3535),
        backgroundColor = Color(0xff505050),
    )
}