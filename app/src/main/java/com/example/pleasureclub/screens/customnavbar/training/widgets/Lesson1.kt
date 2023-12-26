package com.example.pleasureclub.screens.customnavbar.training.widgets

import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.rememberLazyListState
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.derivedStateOf
import androidx.compose.runtime.remember
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
import com.example.pleasureclub.widgets.CustomProgressIndicator

@Composable
fun Lesson1() {
    val itemsCount = 18
    val scrollState = rememberLazyListState()
    val firstVisibleItemIndex = remember { derivedStateOf { scrollState.firstVisibleItemIndex } }.value
    val visibleItemsCount = remember { derivedStateOf { scrollState.layoutInfo } }.value.visibleItemsInfo.size
    val percent = (firstVisibleItemIndex / (itemsCount - visibleItemsCount).toFloat()) * 100f
    Box() {
        LazyColumn(
            state = scrollState,
            modifier = Modifier
                .clip(shape = RoundedCornerShape(28.dp))
                .padding(horizontal = 16.dp)
        ) {
            item {
                Spacer(modifier = Modifier.height(42.dp))
            }
            item {
                Image(
                    painter = painterResource(id = R.drawable.lesson_2),
                    contentDescription = null,
                    contentScale = ContentScale.Crop,
                    modifier = Modifier
                        .fillMaxWidth()
                        .height(180.dp)
                        .clip(RoundedCornerShape(16.dp))
                )
            }
            item {
                Spacer(modifier = Modifier.height(24.dp))
            }
            item {
                Text(
                    text = "Мультипликатор P/E",
                    style = TextStyle(
                        fontWeight = FontWeight.Bold,
                        fontSize = 16.sp,
                        lineHeight = 24.sp,
                        color = Color(0xffFDFDFD),
                    )
                )
            }
            item {
                Spacer(modifier = Modifier.height(20.dp))
            }
            item {
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
            }
            item {
                Spacer(modifier = Modifier.height(16.dp))
            }
            item {
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
            }
            item {
                Spacer(modifier = Modifier.height(28.dp))
            }
            item {
                Text(
                    text = "Для чего нужны мультипликаторы?",
                    style = TextStyle(
                        fontWeight = FontWeight.Bold,
                        fontSize = 16.sp,
                        lineHeight = 24.sp,
                        color = Color(0xffFDFDFD),
                    )
                )
            }
            item {
                Spacer(modifier = Modifier.height(24.dp))
            }
            item {
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
            item {
                Spacer(modifier = Modifier.height(24.dp))
            }
            item {
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
            item {
                Spacer(modifier = Modifier.height(24.dp))
            }
            item {
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
            item {
                Spacer(modifier = Modifier.height(24.dp))
            }
            item {
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
                CustomProgressIndicator(currentProgress = percent / 100)
            }
            Box (
                modifier = Modifier
                    .fillMaxWidth()
                    .weight(4f)
            ){
                CustomProgressIndicator(currentProgress = 0f)
            }
            Box (
                modifier = Modifier
                    .fillMaxWidth()
                    .weight(4f)
            ){
                CustomProgressIndicator(currentProgress = 0f)
            }
            Box (
                modifier = Modifier
                    .fillMaxWidth()
                    .weight(4f)
            ){
                CustomProgressIndicator(currentProgress = 0f)
            }
        }
        //Text(text = scrollText, Modifier.align(Alignment.TopCenter).padding(8.dp))
    }
}