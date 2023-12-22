package com.example.pleasureclub.screens.customnavbar.training.widgets

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp

@Composable
fun Lesson4() {
    Box(
        modifier = Modifier
            .padding(horizontal = 24.dp)
            .padding(bottom = 24.dp)
            .fillMaxSize()
            .background(
                shape = RoundedCornerShape(28.dp),
                color = Color(0xff7FFFD4),
            )
    )
}