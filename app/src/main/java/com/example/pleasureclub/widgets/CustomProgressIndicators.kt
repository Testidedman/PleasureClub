package com.example.pleasureclub.widgets


import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.LinearProgressIndicator
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp

@Composable
fun CustomProgressIndicators(currentProgress: Float, currentIndex: Int) {
    Row(
        Modifier.padding(
            horizontal = 51.39.dp,
            vertical = 16.dp
        )
    ) {
        Box (
            modifier = Modifier
                .fillMaxWidth()
                .weight(4f)
        ){
            LinearProgressIndicator(
                modifier = Modifier.padding(horizontal = 0.61.dp).clip(RoundedCornerShape(100.dp)),
                progress = if (currentIndex == 0) currentProgress else 0f,
                color = Color(0xffFF3535),
                backgroundColor = Color(0xff505050),
            )
        }
        Box (
            modifier = Modifier
                .fillMaxWidth()
                .weight(4f)
        ){
            LinearProgressIndicator(
                modifier = Modifier.padding(horizontal = 0.61.dp).clip(RoundedCornerShape(100.dp)),
                progress = if (currentIndex == 1) currentProgress else 0f,
                color = Color(0xffFF3535),
                backgroundColor = Color(0xff505050),
            )
        }
        Box (
            modifier = Modifier
                .fillMaxWidth()
                .weight(4f)
        ){
            LinearProgressIndicator(
                modifier = Modifier.padding(horizontal = 0.61.dp).clip(RoundedCornerShape(100.dp)),
                progress = if (currentIndex == 2) currentProgress else 0f,
                color = Color(0xffFF3535),
                backgroundColor = Color(0xff505050),
            )
        }
        Box (
            modifier = Modifier
                .fillMaxWidth()
                .weight(4f)
        ){
            LinearProgressIndicator(
                modifier = Modifier.padding(horizontal = 0.61.dp).clip(RoundedCornerShape(100.dp)),
                progress = if (currentIndex == 3) currentProgress else 0f,
                color = Color(0xffFF3535),
                backgroundColor = Color(0xff505050),
            )
        }
    }
}