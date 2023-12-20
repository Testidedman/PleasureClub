package com.example.pleasureclub.screens.customnavbar.main

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.interaction.MutableInteractionSource
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxHeight
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.text.BasicTextField
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.material.SliderColors
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.OutlinedTextFieldDefaults
import androidx.compose.material3.Slider
import androidx.compose.material3.SliderDefaults
import androidx.compose.material3.Text
import androidx.compose.material3.TextFieldDefaults
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableFloatStateOf
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.focus.onFocusChanged
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.Font
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.input.KeyboardType
import androidx.compose.ui.text.input.VisualTransformation
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.navigation.NavHostController
import com.example.pleasureclub.R
import com.example.pleasureclub.enums.TextFieldStatus
import com.example.pleasureclub.widgets.CustomAppBar
import com.example.pleasureclub.widgets.CustomButton

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun NewGoalPage(navController: NavHostController) {
    val goalController = remember { mutableStateOf("") }
    val descriptionController = remember { mutableStateOf("") }
    val goalStatus = remember { mutableStateOf(TextFieldStatus.NONE) }
    val descriptionStatus = remember { mutableStateOf(TextFieldStatus.NONE) }
    val interactionSourceGoal = remember { MutableInteractionSource() }
    val interactionSourceDescription = remember { MutableInteractionSource() }
    var sliderPosition by remember { mutableFloatStateOf(0f) }

    Box(
        modifier = Modifier.fillMaxSize().background(
            color = Color(0xffF2F2F2)
        )
    ) {
        Column() {
            CustomAppBar(
                navController = navController,
                title = "Новая цель"
            )
            Column(
                verticalArrangement = Arrangement.SpaceBetween,
                modifier = Modifier.fillMaxHeight().padding(horizontal = 24.dp).padding(bottom = 8.dp)
            ) {
                Column() {
                    BasicTextField(
                        value = goalController.value,
                        onValueChange = {
                            goalController.value = it
                        },
                        textStyle = TextStyle(
                            fontWeight = FontWeight.W400,
                            fontSize = 13.sp,
                            color = Color(0xff070707)
                        ),
                        modifier = Modifier
                            .fillMaxWidth()
                            .height(44.dp)
                            .clip(RoundedCornerShape(16.dp))
                            .border(
                                width = 1.dp,
                                color = when (goalStatus.value) {
                                    TextFieldStatus.NONE -> Color(0xffD4D4D4)
                                    TextFieldStatus.EDITING -> Color(0xff1B1B1B)
                                    TextFieldStatus.ERROR -> Color(0xffE70000)
                                },
                                shape = RoundedCornerShape(16.dp)
                            )
                            .padding(start = 16.dp)
                            .onFocusChanged {
                                if (it.isFocused) {
                                    goalStatus.value = TextFieldStatus.EDITING
                                } else {
                                    goalStatus.value = TextFieldStatus.NONE
                                }
                            },
                        singleLine = true,
                        keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.Text),
                        interactionSource = interactionSourceGoal,
                    ) {
                        TextFieldDefaults.DecorationBox(
                            placeholder = {
                                Text(
                                    text = "Цель",
                                    style = TextStyle(
                                        fontFamily = FontFamily(
                                            Font(
                                                R.font.montserrat_regular,
                                            ),
                                        ),
                                        fontWeight = FontWeight.Normal,
                                        fontSize = 13.sp,
                                        lineHeight = 20.sp,
                                        color = Color(0xffD4D4D4),
                                    )
                                )
                            },
                            value = goalController.value,
                            innerTextField = it,
                            enabled = true,
                            singleLine = true,
                            visualTransformation = VisualTransformation.None,
                            interactionSource = interactionSourceGoal,
                            colors = OutlinedTextFieldDefaults.colors(),
                            contentPadding = PaddingValues(0.dp),
                        )
                    }
                    Spacer(modifier = Modifier.height(8.dp))
                    BasicTextField(
                        value = descriptionController.value,
                        onValueChange = {
                            descriptionController.value = it
                        },
                        textStyle = TextStyle(
                            fontWeight = FontWeight.W400,
                            fontSize = 13.sp,
                            color = Color(0xff070707),
                            textAlign = TextAlign.Start,
                        ),
                        modifier = Modifier
                            .fillMaxWidth()
                            .height(150.dp)
                            .clip(RoundedCornerShape(16.dp))
                            .border(
                                width = 1.dp,
                                color = when (descriptionStatus.value) {
                                    TextFieldStatus.NONE -> Color(0xffD4D4D4)
                                    TextFieldStatus.EDITING -> Color(0xff1B1B1B)
                                    TextFieldStatus.ERROR -> Color(0xffE70000)
                                },
                                shape = RoundedCornerShape(16.dp)
                            )
                            .padding(horizontal = 16.dp)
                            .onFocusChanged {
                                if (it.isFocused) {
                                    descriptionStatus.value = TextFieldStatus.EDITING
                                } else {
                                    descriptionStatus.value = TextFieldStatus.NONE
                                }
                            },
                        maxLines = 8,
                        keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.Text),
                        interactionSource = interactionSourceDescription,
                    ) {
                        TextFieldDefaults.DecorationBox(
                            placeholder = {
                                Text(
                                    text = "Описание цели",
                                    style = TextStyle(
                                        fontFamily = FontFamily(
                                            Font(
                                                R.font.montserrat_regular,
                                            ),
                                        ),
                                        fontWeight = FontWeight.Normal,
                                        fontSize = 13.sp,
                                        lineHeight = 20.sp,
                                        color = Color(0xffD4D4D4),
                                    )
                                )
                            },
                            value = descriptionController.value,
                            innerTextField = it,
                            enabled = true,
                            singleLine = true,
                            visualTransformation = VisualTransformation.None,
                            interactionSource = interactionSourceDescription,
                            colors = OutlinedTextFieldDefaults.colors(),
                            contentPadding = PaddingValues(0.dp),
                        )
                    }
                    Spacer(modifier = Modifier.height(24.dp))
                    Text(
                        text = "Приоритет цели",
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
                    Spacer(modifier = Modifier.height(8.dp))
                    Slider(
                        value = sliderPosition,
                        onValueChange = { sliderPosition = it },
                        colors = SliderDefaults.colors(
                            thumbColor = when (sliderPosition) {
                                                               0f -> Color(0xffAEAEAE)
                                    0.5f -> Color(0xffFFE177)
                                1f -> Color(0xffFF3535)
                                else -> Color(0xffFF3535)
                            },
                            activeTrackColor = when (sliderPosition) {
                                0f -> Color(0xffAEAEAE)
                                0.5f -> Color(0xffFFE177)
                                1f -> Color(0xffFF3535)
                                else -> Color(0xffFF3535)
                            },
                            inactiveTrackColor = Color(0xffE6E0E9),
                        ),
                        modifier = Modifier.height(20.dp),
                        steps = 1
                    )
                    Spacer(modifier = Modifier.height(6.dp))
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.SpaceBetween
                    ) {
                        Text(
                            text = "Не важно",
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
                        Text(
                            text = "Нормально",
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
                        Text(
                            text = "Важно",
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
                    }
                }
                CustomButton(
                    onClick = {
                        navController.navigate("goals")
                    },
                    title = "Создать цель"
                )
            }
        }
    }
}