package com.example.pleasureclub.screens.customnavbar.training

import androidx.compose.foundation.ExperimentalFoundationApi
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.requiredHeight
import androidx.compose.foundation.pager.HorizontalPager
import androidx.compose.foundation.pager.rememberPagerState
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableFloatStateOf
import androidx.compose.runtime.remember
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp
import androidx.navigation.NavHostController
import com.example.pleasureclub.screens.customnavbar.training.widgets.Lesson1
import com.example.pleasureclub.screens.customnavbar.training.widgets.Lesson4
import com.example.pleasureclub.widgets.CustomAppBar
import com.example.pleasureclub.widgets.CustomProgressIndicator

@OptIn(ExperimentalFoundationApi::class)
@Composable
fun LessonPage(navController: NavHostController) {
    val currentProgress by remember { mutableFloatStateOf(0.5f) }
    val pagerState = rememberPagerState(pageCount = {
        4
    })
    Column(
        modifier = Modifier.background(color = Color(0xffF2F2F2))
    ) {
        CustomAppBar(navController = navController, title = "Урок 2")
        Box(
            modifier = Modifier
                .padding(horizontal = 24.dp)
                .padding(bottom = 24.dp)
                .fillMaxSize()
                .background(
                    shape = RoundedCornerShape(28.dp),
                    color = Color(0xff070707),
                )
        ) {
            HorizontalPager(state = pagerState) {
                if (it == 3) {
                    Lesson4()
                } else {
                    Lesson1()
                }
            }
            Box(
                modifier = Modifier
                    .requiredHeight(54.dp)
                    .fillMaxWidth()
                    .clip(RoundedCornerShape(28.dp))
                    .background(
                        Brush.verticalGradient(
                            colors = listOf(
                                Color(0xff070707),
                                Color(0xff070707).copy(alpha = 0f)
                            ),
                            startY = 0f,
                            endY = 120f
                        )
                    )
            )
            Box(
                modifier = Modifier
                    .requiredHeight(54.dp)
                    .fillMaxWidth()
                    .clip(RoundedCornerShape(28.dp))
                    .background(
                        Brush.verticalGradient(
                            colors = listOf(
                                Color(0xff070707).copy(alpha = 0f),
                                Color(0xff070707)
                            ),
                            startY = 0f,
                            endY = 120f
                        )
                    )
                    .align(Alignment.BottomCenter)
            )
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
                    CustomProgressIndicator(currentProgress = currentProgress)
                }
                Box (
                    modifier = Modifier
                        .fillMaxWidth()
                        .weight(4f)
                ){
                    CustomProgressIndicator(currentProgress = currentProgress)
                }
                Box (
                    modifier = Modifier
                        .fillMaxWidth()
                        .weight(4f)
                ){
                    CustomProgressIndicator(currentProgress = currentProgress)
                }
                Box (
                    modifier = Modifier
                        .fillMaxWidth()
                        .weight(4f)
                ){
                    CustomProgressIndicator(currentProgress = currentProgress)
                }
            }
        }
    }
}