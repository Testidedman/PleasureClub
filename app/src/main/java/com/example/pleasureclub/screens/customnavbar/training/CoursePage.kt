package com.example.pleasureclub.screens.customnavbar.training

import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.Text
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
import androidx.compose.ui.unit.sp
import androidx.navigation.NavHostController
import com.example.pleasureclub.R
import com.example.pleasureclub.widgets.CustomAppBar

@Composable
fun CoursePage(navController: NavHostController) {
    LazyColumn() {
        item() {
            CustomAppBar(navController = navController, title = "Курс")
            Column(
                modifier = Modifier.padding(horizontal = 24.dp)
            ) {
                Box() {
                    Image(
                        painter = painterResource(id = R.drawable.course_background),
                        contentDescription = null,
                        contentScale = ContentScale.Crop,
                        modifier = Modifier
                            .fillMaxWidth()
                            .height(92.dp)
                            .clip(RoundedCornerShape(28.dp))
                    )
                    Row(
                        modifier = Modifier
                            .padding(vertical = 26.dp)
                            .padding(
                                start = 16.dp,
                                end = 23.dp,
                            )
                    ) {
                        Box(
                            modifier = Modifier
                                .size(40.dp)
                                .background(
                                    color = Color(0xffFFFFFF),
                                    shape = RoundedCornerShape(9.41.dp)
                                )
                        ) {
                            Image(
                                painter = painterResource(id = R.drawable.book_saved),
                                contentDescription = null,
                                modifier = Modifier.align(Alignment.Center)
                            )
                        }
                        Spacer(modifier = Modifier.width(8.dp))
                        Text(
                            text = "Фундаментальный анализ",
                            style = TextStyle(
                                fontFamily = FontFamily(
                                    Font(
                                        R.font.unbounded_bold,
                                    ),
                                ),
                                fontWeight = FontWeight.Bold,
                                fontSize = 12.sp,
                                lineHeight = 16.sp,
                                color = Color(0xffFFFFFF),
                            )
                        )
                    }
                }
                Spacer(modifier = Modifier.height(8.dp))
                Row() {
                    Box(
                        modifier = Modifier
                            .height(136.dp)
                            .background(
                            color = Color(0xffFFFFFF),
                            shape = RoundedCornerShape(28.dp)
                        ).padding(
                            top = 16.dp,
                            start = 16.dp,
                            end = 9.38.dp,
                            bottom = 16.dp,
                        )
                    ) {
                        Column(
                            verticalArrangement = Arrangement.SpaceBetween
                        ) {
                            Row() {

                            }

                        }
                    }
                }
            }
        }
    }
}