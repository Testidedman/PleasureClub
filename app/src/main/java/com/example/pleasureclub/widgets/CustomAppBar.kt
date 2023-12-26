package com.example.pleasureclub.widgets

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.width
import androidx.compose.material.Icon
import androidx.compose.material.Text
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.KeyboardArrowLeft
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.Font
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.navigation.NavController
import com.example.pleasureclub.R
import com.example.pleasureclub.data.scaledSp

@Composable
fun CustomAppBar(navController: NavController, title: String) {
    Box(
        modifier = Modifier.height(90.dp).padding(
            horizontal = 24.dp
        )
    ) {
        Row(
            modifier = Modifier.fillMaxSize(),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Box(
                modifier = Modifier.clickable {
                    navController.popBackStack()
                }
            ) {
                Icon(Icons.Filled.KeyboardArrowLeft, contentDescription = null)
            }
            Text(
                text = title,
                style = TextStyle(
                    fontFamily = FontFamily(
                        Font(
                            R.font.unbounded_medium,
                        ),
                    ),
                    fontWeight = FontWeight.Medium,
                    fontSize = 16.scaledSp,
                    lineHeight = 20.scaledSp,
                    color = Color(0xff2B2B2B),
                )
            )
            Spacer(modifier = Modifier.width(24.dp))
        }
    }
}