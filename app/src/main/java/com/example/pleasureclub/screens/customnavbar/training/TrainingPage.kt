package com.example.pleasureclub.screens.customnavbar.training

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp
import androidx.navigation.NavHostController
import com.example.pleasureclub.widgets.CourseCard

@Composable
fun TrainingPage(navController: NavHostController) {
    LazyColumn(
        modifier = Modifier
            .fillMaxSize()
            .background(
                color = Color(0xffF2F2F2)
            ).padding(horizontal = 24.dp).padding(top = 3.38.dp)
    ) {
        items(4) {
            CourseCard(navController = navController)
        }
        item() {
            Spacer(modifier = Modifier.height(53.dp))
        }
    }
}