package com.example.pleasureclub.widgets

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.Button
import androidx.compose.material3.ButtonDefaults
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.Font
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import com.example.pleasureclub.R
import com.example.pleasureclub.data.scaledSp

@Composable
fun CustomButton(onClick: () -> Unit, title: String) {
    Button(
        onClick = onClick,
        colors = ButtonDefaults.buttonColors(
            containerColor = Color(0xffFF3535),
        ),
        modifier = Modifier
            .height(56.dp)
            .fillMaxWidth()
            .clip(RoundedCornerShape(16.dp))
            .background(Color(0xffFF3535)),
    ) {
        Text(
            text = title,
            style = TextStyle(
                fontFamily = FontFamily(
                    Font(
                        R.font.unbounded_semibold,
                    ),
                ),
                fontWeight = FontWeight.SemiBold,
                fontSize = 14.scaledSp,
                lineHeight = 20.scaledSp,
                color = Color(0xffFFFFFF),
            ),
        )
    }
}