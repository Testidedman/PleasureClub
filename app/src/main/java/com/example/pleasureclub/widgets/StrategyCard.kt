package com.example.pleasureclub.widgets

import androidx.compose.foundation.Image
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.Font
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.navigation.NavHostController
import com.example.pleasureclub.R
import com.example.pleasureclub.data.scaledSp

@Composable
fun StrategyCard(navController: NavHostController) {
    Box(
        modifier = Modifier
            .fillMaxWidth()
            .height(160.dp)
    ) {
        Image(
            painter = painterResource(id = R.drawable.course_background),
            contentDescription = null,
            contentScale = ContentScale.Crop,
            modifier = Modifier
                .padding(vertical = 4.dp)
                .fillMaxWidth()
                .height(160.dp)
                .clip(RoundedCornerShape(20.dp)).clickable {
                    navController.navigate("course")
                }
        )
        Text(
            modifier = Modifier
                .padding(vertical = 36.dp)
                .padding(
                    start = 17.dp,
                    end = 70.dp
                )
                .align(Alignment.BottomStart),
            text = "Краткосрочная стратегия",
            style = TextStyle(
                fontFamily = FontFamily(
                    Font(
                        R.font.unbounded_medium,
                    ),
                ),
                fontWeight = FontWeight.Medium,
                fontSize = 14.scaledSp,
                lineHeight = 20.scaledSp,
                color = Color(0xffFDFDFD),
            )
        )
    }
}