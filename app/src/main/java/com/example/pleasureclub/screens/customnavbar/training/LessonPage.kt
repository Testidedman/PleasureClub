package com.example.pleasureclub.screens.customnavbar.training

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.navigation.NavHostController
import com.example.pleasureclub.widgets.CourseCard

@Composable
fun LessonPage(navController: NavHostController) {
    LazyColumn(
        modifier = Modifier
            .fillMaxSize()
            .background(
                color = Color(0xffF2F2F2)
            )
    ) {
        item {

        }
        items(4) {
            CourseCard(navController = navController)
        }
    }
}