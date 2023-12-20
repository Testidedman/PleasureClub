package com.example.pleasureclub.screens.customnavbar.main

import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Arrangement
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
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.Icon
import androidx.compose.material.Text
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Add
import androidx.compose.material.icons.filled.KeyboardArrowRight
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.Font
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.navigation.NavHostController
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController
import com.example.pleasureclub.R
import com.example.pleasureclub.screens.customnavbar.main.widgets.Goal
import com.example.pleasureclub.widgets.CourseCard

@Composable
fun MainPage(navController: NavHostController) {
    Box(
        modifier = Modifier.fillMaxSize().background(
            color = Color(0xffF2F2F2)
        )
    ) {
        LazyColumn {
            // Add a single item
            item {
                Column(
                    modifier = Modifier.padding(start = 24.dp)
                ) {
                    Spacer(modifier = Modifier.height(12.38.dp))
                    Text(
                        text = "Привет, Дмитрий",
                        style = TextStyle(
                            fontFamily = FontFamily(
                                Font(
                                    R.font.unbounded_medium,
                                ),
                            ),
                            fontWeight = FontWeight.Medium,
                            fontSize = 14.sp,
                            lineHeight = 20.sp,
                            color = Color(0xff2B2B2B),
                        )
                    )
                    Text(
                        text = "Начни свой путь в инвестировании!",
                        style = TextStyle(
                            fontFamily = FontFamily(
                                Font(
                                    R.font.montserrat_regular,
                                ),
                            ),
                            fontWeight = FontWeight.Normal,
                            fontSize = 13.sp,
                            lineHeight = 20.sp,
                            color = Color(0xff929292)
                        )
                    )
                    Spacer(modifier = Modifier.height(18.dp))
                }
            }

            item {
                LazyRow(
                    horizontalArrangement = Arrangement.spacedBy(8.dp),
                ) {
                    item {
                        Spacer(modifier = Modifier.width(16.dp))
                    }

                    items(2) { index ->
                        Box(
                            modifier = Modifier
                                .size(72.dp)
                                .border(
                                    shape = RoundedCornerShape(20.dp),
                                    width = 2.dp,
                                    color = Color(0xffFF3535)
                                )
                                .clickable {
                                    navController.navigate("story")
                                }
                        ) {
                            Image(
                                painter = painterResource(id = R.drawable.logo),
                                contentDescription = null,
                                modifier = Modifier
                                    .align(Alignment.Center)
                                    .size(64.dp)
                                    .clip(RoundedCornerShape(20.dp))
                            )
                            Text(
                                text = "Наши новинки",
                                modifier = Modifier
                                    .align(Alignment.BottomCenter)
                                    .padding(bottom = 12.dp)
                            )
                        }
                    }
                }
            }

            item {
                Column(
                    modifier = Modifier.padding(horizontal = 24.dp)
                ) {
                    Spacer(modifier = Modifier.height(26.dp))
                    Row() {
                        Text(
                            text = "Сейчас прохожу",
                            style = TextStyle(
                                fontFamily = FontFamily(
                                    Font(
                                        R.font.unbounded_medium,
                                    ),
                                ),
                                fontWeight = FontWeight.Medium,
                                fontSize = 14.sp,
                                lineHeight = 20.sp,
                                color = Color(0xff2B2B2B),
                            )
                        )
                        Icon(Icons.Filled.KeyboardArrowRight, contentDescription = null)
                    }
                    Spacer(modifier = Modifier.height(4.dp))
                    CourseCard(navController)
                    Spacer(modifier = Modifier.height(20.dp))
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.SpaceBetween,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Row(
                            modifier = Modifier.clickable {
                                navController.navigate("goals")
                            }
                        ) {
                            Text(
                                text = "Цели",
                                style = TextStyle(
                                    fontFamily = FontFamily(
                                        Font(
                                            R.font.unbounded_medium,
                                        ),
                                    ),
                                    fontWeight = FontWeight.Medium,
                                    fontSize = 14.sp,
                                    lineHeight = 20.sp,
                                    color = Color(0xff2B2B2B),
                                )
                            )
                            Icon(Icons.Filled.KeyboardArrowRight, contentDescription = null)
                        }
                        Row(
                            modifier = Modifier.clickable {
                                navController.navigate("new_goal")
                            }
                        ) {
                            Text(
                                text = "Создать цель",
                                style = TextStyle(
                                    fontFamily = FontFamily(
                                        Font(
                                            R.font.montserrat_medium,
                                        ),
                                    ),
                                    fontWeight = FontWeight.Medium,
                                    fontSize = 10.sp,
                                    lineHeight = 10.sp,
                                    color = Color(0xffFF3535),
                                )
                            )
                            Spacer(modifier = Modifier.width(4.dp))
                            Icon(
                                Icons.Filled.Add,
                                contentDescription = null,
                                modifier = Modifier.size(16.dp),
                                tint = Color(0xffFF3535)
                            )
                        }
                    }
                    Spacer(modifier = Modifier.height(14.dp))
                }
            }

            // Add another single item
            items(3) {
                Goal(navController = navController)
            }
            item {
                Spacer(modifier = Modifier.height(49.dp))
            }
        }
    }
}