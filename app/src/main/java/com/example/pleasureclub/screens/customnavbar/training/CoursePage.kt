package com.example.pleasureclub.screens.customnavbar.training

import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxHeight
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.Icon
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Done
import androidx.compose.material.icons.filled.KeyboardArrowRight
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

val filters = listOf<String>(
    "Основы",
    "Мультипликаторы",
    "Отчеты",
    "Что-то еще"
)

@Composable
fun CoursePage(navController: NavHostController) {
    LazyColumn(
        modifier = Modifier.background(color = Color(0xffF2F2F2))
    ) {
        item {
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
                            .fillMaxWidth()
                            .weight(1f)
                            .background(
                                color = Color(0xffFFFFFF),
                                shape = RoundedCornerShape(28.dp)
                            )
                            .padding(
                                top = 16.dp,
                                start = 16.dp,
                                end = 9.38.dp,
                                bottom = 16.dp,
                            )
                    ) {
                        Column(
                            verticalArrangement = Arrangement.SpaceBetween,
                            modifier = Modifier.fillMaxHeight()
                        ) {
                            Row(
                                verticalAlignment = Alignment.CenterVertically
                            ) {
                                Image(
                                    painter = painterResource(id = R.drawable.priority_indicator),
                                    contentDescription = null,
                                )
                                Spacer(modifier = Modifier.width(8.dp))
                                Text(
                                    text = "Общий прогресс",
                                    style = TextStyle(
                                        fontFamily = FontFamily(
                                            Font(
                                                R.font.unbounded_medium,
                                            ),
                                        ),
                                        fontWeight = FontWeight.Medium,
                                        fontSize = 8.sp,
                                        lineHeight = 12.sp,
                                        color = Color(0xff2B2B2B),
                                    )
                                )
                            }
                            Text(
                                text = "39%",
                                style = TextStyle(
                                    fontFamily = FontFamily(
                                        Font(
                                            R.font.unbounded_bold,
                                        ),
                                    ),
                                    fontWeight = FontWeight.Bold,
                                    fontSize = 26.sp,
                                    lineHeight = 36.sp,
                                    color = Color(0xff0F0F0F),
                                )
                            )
                        }
                    }
                    Spacer(modifier = Modifier.width(4.dp))
                    Box(
                        modifier = Modifier
                            .height(136.dp)
                            .fillMaxWidth()
                            .weight(1f)
                            .background(
                                color = Color(0xffFFFFFF),
                                shape = RoundedCornerShape(28.dp)
                            )
                            .padding(
                                top = 16.dp,
                                start = 16.dp,
                                end = 9.38.dp,
                                bottom = 16.dp,
                            )
                    ) {
                        Column(
                            verticalArrangement = Arrangement.SpaceBetween,
                            modifier = Modifier.fillMaxHeight()
                        ) {
                            Row(
                                verticalAlignment = Alignment.CenterVertically
                            ) {
                                Image(
                                    painter = painterResource(id = R.drawable.medal_star),
                                    contentDescription = null,
                                )
                                Spacer(modifier = Modifier.width(8.dp))
                                Text(
                                    text = "Тестов пройдено",
                                    style = TextStyle(
                                        fontFamily = FontFamily(
                                            Font(
                                                R.font.unbounded_medium,
                                            ),
                                        ),
                                        fontWeight = FontWeight.Medium,
                                        fontSize = 8.sp,
                                        lineHeight = 12.sp,
                                        color = Color(0xff2B2B2B),
                                    )
                                )
                            }
                            Row(
                                verticalAlignment = Alignment.Bottom
                            ) {
                                Text(
                                    text = "6",
                                    style = TextStyle(
                                        fontFamily = FontFamily(
                                            Font(
                                                R.font.unbounded_bold,
                                            ),
                                        ),
                                        fontWeight = FontWeight.Bold,
                                        fontSize = 26.sp,
                                        lineHeight = 36.sp,
                                        color = Color(0xff0F0F0F),
                                    )
                                )
                                Text(
                                    text = "/15",
                                    style = TextStyle(
                                        fontFamily = FontFamily(
                                            Font(
                                                R.font.unbounded_bold,
                                            ),
                                        ),
                                        fontWeight = FontWeight.Bold,
                                        fontSize = 12.sp,
                                        lineHeight = 36.sp,
                                        color = Color(0xff929292),
                                    )
                                )
                            }
                        }
                    }
                }
                Spacer(modifier = Modifier.height(40.dp))
            }
           LazyRow(
               horizontalArrangement = Arrangement.spacedBy(4.dp)
           ) {
               item {
                   Spacer(modifier = Modifier.width(20.dp))
               }
               items(filters.count()) {
                   Box(
                       modifier = Modifier
                           .border(
                               1.dp,
                               shape = RoundedCornerShape(12.dp),
                               color = Color(0xff0F0F0F)
                           )
                           .padding(
                               horizontal = 16.dp,
                               vertical = 6.dp
                           )
                   ) {
                       Text(
                           text = filters[it],
                           style = TextStyle(
                               fontFamily = FontFamily(
                                   Font(
                                       R.font.montserrat_medium,
                                   ),
                               ),
                               fontWeight = FontWeight.Medium,
                               fontSize = 12.sp,
                               lineHeight = 20.sp,
                               color = Color(0xff0F0F0F),
                           )
                       )
                   }
               }
           }
            Spacer(modifier = Modifier.height(16.dp))
            Box(
                modifier = Modifier
                    .background(
                        color = Color(0xffFFFFFF),
                        shape = RoundedCornerShape(
                            topEnd = 36.dp,
                            topStart = 36.dp
                        )
                    )
                    .fillMaxWidth()
                    .padding(24.dp)
            ) {
                Column() {
                    Box(
                        modifier = Modifier
                            .background(
                                color = Color(0xffF6F6F6),
                                shape = RoundedCornerShape(20.dp)
                            )
                            .fillMaxWidth()
                            .clickable {
                                navController.navigate("lesson")
                            }
                            .padding(
                                vertical = 18.dp,
                                horizontal = 16.dp
                            )
                            .padding(
                                end = 6.dp
                            )
                    ) {
                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.SpaceBetween

                        ) {
                            Column {
                                Row(
                                    verticalAlignment = Alignment.CenterVertically
                                ) {
                                    Text(
                                        text = "Урок 1",
                                        style = TextStyle(
                                            fontFamily = FontFamily(
                                                Font(
                                                    R.font.montserrat_medium,
                                                ),
                                            ),
                                            fontWeight = FontWeight.Medium,
                                            fontSize = 10.sp,
                                            lineHeight = 16.sp,
                                            color = Color(0xff929292),
                                        )
                                    )
                                    Spacer(modifier = Modifier.width(4.dp))
                                    Icon(
                                        Icons.Filled.KeyboardArrowRight,
                                        contentDescription = null,
                                        tint = Color(0xff929292),
                                        modifier = Modifier.size(12.dp)
                                    )
                                }
                                Text(
                                    text = "Ручные мультипликаторы",
                                    style = TextStyle(
                                        fontFamily = FontFamily(
                                            Font(
                                                R.font.montserrat_medium,
                                            ),
                                        ),
                                        fontWeight = FontWeight.Medium,
                                        fontSize = 12.sp,
                                        lineHeight = 16.sp,
                                        color = Color(0xff2B2B2B),
                                    )
                                )
                            }
                            Box(
                                modifier = Modifier
                                    .size(36.dp)
                                    .border(
                                        width = 4.dp,
                                        color = Color(0xffFFCC47),
                                        shape = CircleShape
                                    )
                            ) {
                                Icon(
                                    Icons.Filled.Done,
                                    contentDescription = null,
                                    tint = Color(0xff2B2B2B),
                                    modifier = Modifier.size(16.dp).align(Alignment.Center)
                                )
                            }
                        }
                    }
                }
            }
        }
    }
}