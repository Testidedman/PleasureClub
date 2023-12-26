package com.example.pleasureclub.screens

import android.annotation.SuppressLint
import androidx.compose.foundation.Image
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.interaction.MutableInteractionSource
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.text.BasicTextField
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.IconButton
import androidx.compose.material3.OutlinedTextFieldDefaults
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.material3.TextFieldDefaults
import androidx.compose.runtime.Composable
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.focus.onFocusChanged
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.ColorFilter
import androidx.compose.ui.platform.LocalFocusManager
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.Font
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.input.KeyboardType
import androidx.compose.ui.text.input.PasswordVisualTransformation
import androidx.compose.ui.text.input.VisualTransformation
import androidx.compose.ui.unit.dp
import androidx.navigation.NavHostController
import com.example.pleasureclub.R
import com.example.pleasureclub.data.scaledSp
import com.example.pleasureclub.enums.TextFieldStatus
import com.example.pleasureclub.widgets.CustomButton

@OptIn(ExperimentalMaterial3Api::class)
@SuppressLint("UnusedMaterial3ScaffoldPaddingParameter")
@Composable
fun AuthorizationPage(navController: NavHostController) {
    val loginController = remember { mutableStateOf("") }
    val passwordController = remember { mutableStateOf("") }
    val isObscure = rememberSaveable { mutableStateOf(false) }
    val loginStatus = remember { mutableStateOf(TextFieldStatus.NONE) }
    val passwordStatus = remember { mutableStateOf(TextFieldStatus.NONE) }
    val canTap = remember { mutableStateOf(false) }
    val focusManager = LocalFocusManager.current
    val interactionSourceLogin = remember { MutableInteractionSource() }
    val interactionSourcePassword = remember { MutableInteractionSource() }

    fun checkCanTap() {
        canTap.value = loginController.value.isNotEmpty() && passwordController.value.isNotEmpty()
    }

    Surface(
        modifier = Modifier.fillMaxSize(),
        onClick = {
            focusManager.clearFocus()
        },
        content = {
            Column(
                modifier = Modifier
                    .fillMaxSize()
                    .padding(horizontal = 24.dp),
                verticalArrangement = Arrangement.SpaceBetween,
            ) {
                Image(
                    painter = painterResource(id = R.drawable.logo),
                    contentDescription = null,
                    modifier = Modifier
                        .padding(
                            top = 27.38.dp,
                        )
                        .size(
                            height = 30.dp,
                            width = 24.dp,
                        )
                )
                Column(
                    horizontalAlignment = Alignment.Start,
                ) {
                    Text(
                        text = "Авторизация",
                        modifier = Modifier.align(Alignment.CenterHorizontally),
                        style = TextStyle(
                            fontSize = 24.scaledSp,
                            color = Color(0xff151515),
                            fontWeight = FontWeight.Medium,
                            fontFamily = FontFamily(
                                Font(
                                    R.font.unbounded_medium,
                                ),
                            ),
                        ),
                    )
                    Spacer(modifier = Modifier.height(8.dp))
                    if (loginStatus.value == TextFieldStatus.ERROR) {
                        Text(
                            text = "Логин введён неверно",
                            style = TextStyle(
                                fontWeight = FontWeight.Normal,
                                fontSize = 12.scaledSp,
                                lineHeight = 20.scaledSp,
                                color = Color(0xffE70000),
                                fontFamily = FontFamily(
                                    Font(
                                        R.font.montserrat_regular,
                                    ),
                                ),
                            ),
                            modifier = Modifier
                                .padding(
                                    top = 8.dp,
                                    bottom = 2.dp,
                                    start = 16.dp,
                                ),
                        )
                    }
                    else {
                        Spacer(modifier = Modifier.height(20.dp))
                    }
                    Spacer(modifier = Modifier.height(2.dp))
                    BasicTextField(
                        value = loginController.value,
                        onValueChange = {
                            loginController.value = it
                            checkCanTap()
                        },
                        textStyle = TextStyle(
                            fontWeight = FontWeight.W400,
                            fontSize = 13.scaledSp,
                            color = Color(0xff070707)
                        ),
                        modifier = Modifier
                            .fillMaxWidth()
                            .height(44.dp)
                            .clip(RoundedCornerShape(16.dp))
                            .border(
                                width = 1.dp,
                                color = when (loginStatus.value) {
                                    TextFieldStatus.NONE -> Color(0xffD4D4D4)
                                    TextFieldStatus.EDITING -> Color(0xff1B1B1B)
                                    TextFieldStatus.ERROR -> Color(0xffE70000)
                                },
                                shape = RoundedCornerShape(16.dp)
                            )
                            .padding(start = 16.dp)
                            .onFocusChanged {
                                if (it.isFocused) {
                                    loginStatus.value = TextFieldStatus.EDITING
                                } else {
                                    loginStatus.value = TextFieldStatus.NONE
                                }
                            },
                        singleLine = true,
                        keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.Text),
                        interactionSource = interactionSourceLogin,
                    ) {
                        TextFieldDefaults.DecorationBox(
                            placeholder = {
                                Text(
                                    text = "Логин",
                                    style = TextStyle(
                                        fontFamily = FontFamily(
                                            Font(
                                                R.font.montserrat_regular,
                                            ),
                                        ),
                                        fontWeight = FontWeight.Normal,
                                        fontSize = 13.scaledSp,
                                        lineHeight = 20.scaledSp,
                                        color = Color(0xffD4D4D4),
                                    )
                                )
                            },
                            value = loginController.value,
                            innerTextField = it,
                            enabled = true,
                            singleLine = true,
                            visualTransformation = VisualTransformation.None,
                            interactionSource = interactionSourceLogin,
                            colors = OutlinedTextFieldDefaults.colors(),
                            contentPadding = PaddingValues(0.dp),
                        )
                    }
                    Spacer(modifier = Modifier.height(8.dp))
                    BasicTextField(
                        value = passwordController.value,
                        onValueChange = {
                            passwordController.value = it
                            checkCanTap()
                        },
                        textStyle = TextStyle(
                            fontWeight = FontWeight.W400,
                            fontSize = 13.scaledSp,
                            color = Color(0xff070707)
                        ),
                        modifier = Modifier
                            .fillMaxWidth()
                            .height(44.dp)
                            .clip(RoundedCornerShape(16.dp))
                            .border(
                                width = 1.dp,
                                color = when (passwordStatus.value) {
                                    TextFieldStatus.NONE -> Color(0xffD4D4D4)
                                    TextFieldStatus.EDITING -> Color(0xff1B1B1B)
                                    TextFieldStatus.ERROR -> Color(0xffE70000)
                                },
                                shape = RoundedCornerShape(16.dp)
                            )
                            .padding(start = 16.dp)
                            .onFocusChanged {
                                if (it.isFocused) {
                                    passwordStatus.value = TextFieldStatus.EDITING
                                } else {
                                    passwordStatus.value = TextFieldStatus.NONE
                                }
                            },
                        singleLine = true,
                        keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.Text),
                        //interactionSource = interactionSourcePassword,
                        visualTransformation = if (isObscure.value) VisualTransformation.None else PasswordVisualTransformation(),
                    ) {
                        TextFieldDefaults.DecorationBox(
                            placeholder = {
                                Text(
                                    text = "Пароль",
                                    style = TextStyle(
                                        fontFamily = FontFamily(
                                            Font(
                                                R.font.montserrat_regular,
                                            ),
                                        ),
                                        fontWeight = FontWeight.Normal,
                                        fontSize = 13.scaledSp,
                                        lineHeight = 20.scaledSp,
                                        color = Color(0xffD4D4D4),
                                    )
                                )
                            },
                            value = passwordController.value,
                            innerTextField = it,
                            enabled = true,
                            singleLine = true,
                            visualTransformation = if (isObscure.value) VisualTransformation.None else PasswordVisualTransformation(),
                            interactionSource = interactionSourcePassword,
                            colors = OutlinedTextFieldDefaults.colors(),
                            contentPadding = PaddingValues(0.dp),
                            suffix = {
                                IconButton(
                                    onClick = {
                                        isObscure.value = !isObscure.value
                                    }
                                ) {
                                    Image(
                                        painter = painterResource(id = if (isObscure.value) {
                                            R.drawable.visibility_disabled
                                        } else {
                                            R.drawable.visibility_enabled
                                        }),
                                        contentDescription = null,
                                        colorFilter = ColorFilter.tint(if (passwordStatus.value == TextFieldStatus.NONE) Color(0xffD4D4D4) else Color(0xff1B1B1B)),
                                        modifier = Modifier
                                            .size(
                                                height = 24.dp,
                                                width = 24.dp,
                                            )
                                    )
                                }
                            }
                        )
                    }
                    Spacer(modifier = Modifier.height(2.dp))
                    if (passwordStatus.value == TextFieldStatus.ERROR) {
                        Text(
                            text = "Пароль введён неверно",
                            style = TextStyle(
                                fontWeight = FontWeight.Normal,
                                fontSize = 12.scaledSp,
                                lineHeight = 20.scaledSp,
                                color = Color(0xffE70000),
                                fontFamily = FontFamily(
                                    Font(
                                        R.font.montserrat_regular,
                                    ),
                                ),
                            ),
                            modifier = Modifier
                                .padding(
                                    top = 8.dp,
                                    bottom = 2.dp,
                                    start = 16.dp,
                                ),
                        )
                    }
                    else {
                        Spacer(modifier = Modifier.height(20.dp))
                    }
                    Spacer(modifier = Modifier.height(10.dp))
                    CustomButton(
                        onClick = {
                            focusManager.clearFocus()
                            navController.navigate("navbar")
                        },
                        title = "Войти"
                    )
                    Spacer(modifier = Modifier.height(8.dp))
                    Row(
                        horizontalArrangement = Arrangement.Center,
                        modifier = Modifier.fillMaxWidth()
                    ) {
                        Text(
                            text = "Проблемы в авторизацией? ",
                            style = TextStyle(
                                fontFamily = FontFamily(
                                    Font(
                                        R.font.montserrat_regular,
                                    ),
                                ),
                                fontWeight = FontWeight.Normal,
                                fontSize = 12.scaledSp,
                                lineHeight = 20.scaledSp,
                                color = Color(0xff2B2B2B),
                            ),
                        )
                        Text(
                            text = "Пиши сюда",
                            style = TextStyle(
                                fontFamily = FontFamily(
                                    Font(
                                        R.font.montserrat_semibold,
                                    ),
                                ),
                                fontWeight = FontWeight.SemiBold,
                                fontSize = 14.scaledSp,
                                lineHeight = 20.scaledSp,
                                color = Color(0xff2B2B2B),
                            ),
                            modifier = Modifier.clickable {}
                        )
                    }
                }
                Spacer(modifier = Modifier.height(30.dp))
            }
        }
    )
}