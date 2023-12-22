package com.example.pleasureclub.screens.customnavbar.training.widgets

import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
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
import com.example.pleasureclub.R

@Composable
fun Lesson1() {
    LazyColumn(
        modifier = Modifier.clip(shape = RoundedCornerShape(28.dp))
    ) {
        item {
            Column(
                Modifier.padding(horizontal = 16.dp, vertical = 42.dp)
            ) {
                Image(
                    painter = painterResource(id = R.drawable.lesson_2),
                    contentDescription = null,
                    contentScale = ContentScale.Crop,
                    modifier = Modifier
                        .fillMaxWidth()
                        .height(180.dp)
                        .clip(RoundedCornerShape(16.dp))
                )
                Spacer(modifier = Modifier.height(24.dp))
                Text(
                    text = "Мультипликатор P/E",
                    style = TextStyle(
                        fontWeight = FontWeight.Bold,
                        fontSize = 16.sp,
                        lineHeight = 24.sp,
                        color = Color(0xffFDFDFD),
                    )
                )
                Spacer(modifier = Modifier.height(20.dp))
                Text(
                    text = "Речь идет о соотношении капитализация/прибыль. " +
                            "Некоторые считают его «священным Граалем»," +
                            " другие указывают на недостатки этого показателя. Истина где-то посередине.",
                    style = TextStyle(
                        fontFamily = FontFamily(
                            Font(
                                R.font.montserrat_medium,
                            ),
                        ),
                        fontWeight = FontWeight.Medium,
                        fontSize = 10.sp,
                        lineHeight = 16.sp,
                        color = Color(0xffF8F8F8),
                    )
                )
                Spacer(modifier = Modifier.height(16.dp))
                Text(
                    text = "Как и любой другой мультипликатор, P/E необходимо правильно использовать, " +
                            "а ситуацию полезно оценивать в комплексе, " +
                            "не полагаясь на один единственный показатель.",
                    style = TextStyle(
                        fontFamily = FontFamily(
                            Font(
                                R.font.montserrat_medium,
                            ),
                        ),
                        fontWeight = FontWeight.Medium,
                        fontSize = 10.sp,
                        lineHeight = 16.sp,
                        color = Color(0xffF8F8F8),
                    )
                )
                Spacer(modifier = Modifier.height(28.dp))
                Text(
                    text = "Для чего нужны мультипликаторы?",
                    style = TextStyle(
                        fontWeight = FontWeight.Bold,
                        fontSize = 16.sp,
                        lineHeight = 24.sp,
                        color = Color(0xffFDFDFD),
                    )
                )
                Spacer(modifier = Modifier.height(24.dp))
                Text(
                    text = "Речь идет о фундаментальном анализе, точнее сравнительной оценке." +
                            "Оценку эту принято считать «быстрой и грубой», она способна дать мгновенную, хотя и менее точную по сравнению со сложными моделями дисконтирования денежных потоков картину действительности: " +
                            "показать насколько акций недооценена/переоценена по сравнению с конкурентами.",
                    style = TextStyle(
                        fontFamily = FontFamily(
                            Font(
                                R.font.montserrat_medium,
                            ),
                        ),
                        fontWeight = FontWeight.Medium,
                        fontSize = 10.sp,
                        lineHeight = 16.sp,
                        color = Color(0xffF8F8F8),
                    )
                )
                Spacer(modifier = Modifier.height(24.dp))
                Text(
                    text = "Речь идет о фундаментальном анализе, точнее сравнительной оценке." +
                            "Оценку эту принято считать «быстрой и грубой», она способна дать мгновенную, хотя и менее точную по сравнению со сложными моделями дисконтирования денежных потоков картину действительности: " +
                            "показать насколько акций недооценена/переоценена по сравнению с конкурентами.",
                    style = TextStyle(
                        fontFamily = FontFamily(
                            Font(
                                R.font.montserrat_medium,
                            ),
                        ),
                        fontWeight = FontWeight.Medium,
                        fontSize = 10.sp,
                        lineHeight = 16.sp,
                        color = Color(0xffF8F8F8),
                    )
                )
                Spacer(modifier = Modifier.height(24.dp))
                Text(
                    text = "Речь идет о фундаментальном анализе, точнее сравнительной оценке." +
                            "Оценку эту принято считать «быстрой и грубой», она способна дать мгновенную, хотя и менее точную по сравнению со сложными моделями дисконтирования денежных потоков картину действительности: " +
                            "показать насколько акций недооценена/переоценена по сравнению с конкурентами.",
                    style = TextStyle(
                        fontFamily = FontFamily(
                            Font(
                                R.font.montserrat_medium,
                            ),
                        ),
                        fontWeight = FontWeight.Medium,
                        fontSize = 10.sp,
                        lineHeight = 16.sp,
                        color = Color(0xffF8F8F8),
                    )
                )
                Spacer(modifier = Modifier.height(24.dp))
                Text(
                    text = "Речь идет о фундаментальном анализе, точнее сравнительной оценке." +
                            "Оценку эту принято считать «быстрой и грубой», она способна дать мгновенную, хотя и менее точную по сравнению со сложными моделями дисконтирования денежных потоков картину действительности: " +
                            "показать насколько акций недооценена/переоценена по сравнению с конкурентами.",
                    style = TextStyle(
                        fontFamily = FontFamily(
                            Font(
                                R.font.montserrat_medium,
                            ),
                        ),
                        fontWeight = FontWeight.Medium,
                        fontSize = 10.sp,
                        lineHeight = 16.sp,
                        color = Color(0xffF8F8F8),
                    )
                )
            }
        }
    }
}