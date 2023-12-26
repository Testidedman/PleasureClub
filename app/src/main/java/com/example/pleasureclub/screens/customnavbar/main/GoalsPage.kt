package com.example.pleasureclub.screens.customnavbar.main

import androidx.compose.animation.core.animateDpAsState
import androidx.compose.foundation.ExperimentalFoundationApi
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.pager.HorizontalPager
import androidx.compose.foundation.pager.rememberPagerState
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Add
import androidx.compose.material3.Icon
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.rememberCoroutineScope
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.LocalConfiguration
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.Font
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.navigation.NavHostController
import com.example.pleasureclub.R
import com.example.pleasureclub.data.scaledSp
import com.example.pleasureclub.screens.customnavbar.main.widgets.Goal
import com.example.pleasureclub.widgets.CustomAppBar
import kotlinx.coroutines.launch

@OptIn(ExperimentalFoundationApi::class)
@Composable
fun GoalsPage(navController: NavHostController) {
    val pagerState = rememberPagerState(pageCount = {
        2
    })
    val coroutineScope = rememberCoroutineScope()
    var achieved by remember {
        mutableStateOf(false)
    }
    val configuration = LocalConfiguration.current
    val animatedPadding by animateDpAsState(
        if (achieved) {
            configuration.screenWidthDp.dp / 2 - 22.dp
        } else {
            2.dp
        },
        label = "padding"
    )
    Box(
        modifier = Modifier
            .fillMaxSize()
            .background(
                color = Color(0xffF2F2F2)
            )
    ) {
        Column() {
            CustomAppBar(
                navController = navController,
                title = "Цели"
            )
            Box(
                modifier = Modifier
                    .padding(horizontal = 24.dp)
                    .fillMaxWidth()
                    .height(44.dp)
                    .background(
                        color = Color(0xffE9E9E9),
                        shape = RoundedCornerShape(16.dp)
                    )
            ) {
                Box(
                    modifier = Modifier
                        .padding(
                            start = animatedPadding,
                            top = 2.dp,
                            bottom = 2.dp
                        )
                        .width(configuration.screenWidthDp.dp / 2 - 22.dp)
                        .height(40.dp)
                        .background(
                            color = Color(0xff0F0F0F),
                            shape = RoundedCornerShape(16.dp)
                        )
                )
                Row(
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Box(
                        modifier = Modifier
                            .width(configuration.screenWidthDp.dp / 2 - 22.dp)
                            .height(40.dp)
                            .clickable {
                                achieved = false
                                coroutineScope.launch {
                                    pagerState.scrollToPage(0)
                                }
                            }
                    ) {
                        Text(
                            text = "Активные",
                            textAlign = TextAlign.Center,
                            style = TextStyle(
                                fontFamily = FontFamily(
                                    Font(
                                        R.font.montserrat_semibold,
                                    ),
                                ),
                                fontWeight = FontWeight.SemiBold,
                                fontSize = 13.scaledSp,
                                lineHeight = 20.scaledSp,
                                color = if (achieved) Color(0xff000000) else Color(0xffF8F8F8)
                            ),
                            modifier = Modifier.align(Alignment.Center)
                        )
                    }
                    Box(
                        modifier = Modifier
                            .width(configuration.screenWidthDp.dp / 2 - 22.dp)
                            .height(40.dp)
                            .clickable {
                                achieved = true
                                coroutineScope.launch {
                                    pagerState.scrollToPage(1)
                                }
                            }
                    ) {
                        Text(
                            text = "Достигнутые",
                            textAlign = TextAlign.Center,
                            style = TextStyle(
                                fontFamily = FontFamily(
                                    Font(
                                        R.font.montserrat_semibold,
                                    ),
                                ),
                                fontWeight = FontWeight.SemiBold,
                                fontSize = 13.scaledSp,
                                lineHeight = 20.scaledSp,
                                color = if (achieved) Color(0xffF8F8F8) else Color(0xff000000)
                            ),
                            modifier = Modifier.align(Alignment.Center)
                        )
                    }
                }
            }
            Spacer(modifier = Modifier.height(22.dp))
            HorizontalPager(
                state = pagerState,
                userScrollEnabled = false,
            ) { page ->
                LazyColumn() {
                    items(page) {
                        Goal(navController = navController)
                    }
                }
            }
        }
        Box(
            modifier = Modifier.align(Alignment.BottomEnd).padding(
                bottom = 8.dp,
                end = 24.dp,
            ).background(
                color = Color(0xffFF3535),
                shape = RoundedCornerShape(16.dp)
            ).size(56.dp).clickable {
                navController.navigate("new_goal")
            }
        ) {
            Icon(
                Icons.Filled.Add,
                contentDescription = null,
                tint = Color(0xffFFFFFF),
                modifier = Modifier.align(Alignment.Center)
            )
        }
    }
}