package com.example.pleasureclub.screens.customnavbar.main

import androidx.compose.foundation.ExperimentalFoundationApi
import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.pager.HorizontalPager
import androidx.compose.foundation.pager.rememberPagerState
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableIntStateOf
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.painterResource
import androidx.navigation.NavHostController
import com.example.pleasureclub.R
import kotlinx.coroutines.delay
import kotlin.time.Duration.Companion.seconds

@OptIn(ExperimentalFoundationApi::class)
@Composable
fun StoryPage(navController: NavHostController) {
    val pagerState = rememberPagerState(pageCount = {
        2
    })
    var ticks by remember { mutableIntStateOf(0) }
    LaunchedEffect(Unit) {
        while(ticks <= pagerState.pageCount) {
            if (ticks == pagerState.pageCount) {
                navController.popBackStack()
                break
            }
            else {
                delay(5.seconds)
                ticks++
                pagerState.animateScrollToPage(
                    page = ticks,
                )
            }
        }
    }
    HorizontalPager(state = pagerState) {
        Image(
            painter = painterResource(id = R.drawable.logo),
            contentDescription = null,
            modifier = Modifier.fillMaxSize()
        )
    }
}