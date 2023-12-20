package com.example.pleasureclub.widgets

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
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.Text
import androidx.compose.material3.LinearProgressIndicator
import androidx.compose.material3.ProgressIndicatorDefaults
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

@Composable
fun CourseCard(navController: NavHostController) {
    Box(
        modifier = Modifier.fillMaxWidth().height(160.dp)
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
        Column(
            modifier = Modifier.fillMaxSize().padding(
                horizontal = 16.dp,
                vertical = 24.dp,
            ),
            Arrangement.SpaceBetween
        ) {
            Row() {
                Box(
                    modifier = Modifier
                        .background(
                            color = Color(0xffFFFFFF),
                            shape = RoundedCornerShape(100.dp)
                        ).padding(
                            horizontal = 12.dp,
                            vertical = 3.dp,
                        )
                ) {
                    Text(
                        text = "5 блоков",
                        style = TextStyle(
                            fontFamily = FontFamily(
                                Font(
                                    R.font.montserrat_semibold,
                                ),
                            ),
                            fontWeight = FontWeight.SemiBold,
                            fontSize = 8.sp,
                            lineHeight = 20.sp,
                            color = Color(0xff2B2B2B),
                        )
                    )
                }
                Spacer(modifier = Modifier.width(4.dp))
                Box(
                    modifier = Modifier
                        .background(
                            color = Color(0xffFFFFFF),
                            shape = RoundedCornerShape(100.dp)
                        ).padding(
                            horizontal = 12.dp,
                            vertical = 3.dp,
                        )
                ) {
                    Text(
                        text = "5 блоков",
                        style = TextStyle(
                            fontFamily = FontFamily(
                                Font(
                                    R.font.montserrat_semibold,
                                ),
                            ),
                            fontWeight = FontWeight.SemiBold,
                            fontSize = 8.sp,
                            lineHeight = 20.sp,
                            color = Color(0xff2B2B2B),
                        )
                    )
                }
            }
            Column {
                Text(
                    text = "Фундаментальный анализ",
                    style = TextStyle(
                        fontFamily = FontFamily(
                            Font(
                                R.font.unbounded_medium,
                            ),
                        ),
                        fontWeight = FontWeight.Medium,
                        fontSize = 14.sp,
                        lineHeight = 20.sp,
                        color = Color(0xffFDFDFD),
                    )
                )
                Text(
                    text = "57%",
                    modifier = Modifier.align(Alignment.End),
                    style = TextStyle(
                        fontFamily = FontFamily(
                            Font(
                                R.font.montserrat_bold,
                            ),
                        ),
                        fontWeight = FontWeight.Bold,
                        fontSize = 12.sp,
                        lineHeight = 20.sp,
                        color = Color(0xffF8F8F8),
                    )
                )
                LinearProgressIndicator(
                    10f,
                    modifier = Modifier.fillMaxWidth().height(4.dp).clip(RoundedCornerShape(100.dp)),
//                    color = Color(0xffFF3535),
//                    trackColor = Color(0xff2B2B2B),
                )
            }
        }
    }
}