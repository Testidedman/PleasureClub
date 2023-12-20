package com.example.pleasureclub.screens.customnavbar.main.widgets

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
import androidx.compose.material.Icon
import androidx.compose.material.Text
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Done
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.ColorFilter
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.Font
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.navigation.NavController
import com.example.pleasureclub.R

@Composable
fun Goal(navController: NavController) {
    Box(
        modifier = Modifier.padding(
            vertical = 2.dp,
            horizontal = 24.dp,
        ).height(56.dp).background(
            color = Color(0xffFDFDFD),
            shape = RoundedCornerShape(16.dp)
        ).clickable {
            navController.navigate("new_goal")
        }
            .padding(
            horizontal = 16.dp,
            vertical = 11.dp,
        )
    ) {
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Row() {
                Box(
                    modifier = Modifier.background(
                        color = Color(0xffFF3535).copy(
                            alpha = 0.3f
                        ),
                        shape = RoundedCornerShape(8.dp),
                    ).padding(8.dp)
                ) {
                    Image(
                        painter = painterResource(id = R.drawable.chart),
                        contentDescription = null,
                        colorFilter = ColorFilter.tint(
                            color = Color(0xffFF3535),
                        )
                    )
                }
                Spacer(modifier = Modifier.width(8.dp))
                Column(
                    modifier = Modifier.fillMaxHeight(),
                    verticalArrangement = Arrangement.Center
                ) {
                    Text(
                        text = "Первый блок",
                        style = TextStyle(
                            fontFamily = FontFamily(
                                Font(
                                    R.font.montserrat_medium,
                                ),
                            ),
                            fontWeight = FontWeight.Medium,
                            fontSize = 12.sp,
                            lineHeight = 18.sp,
                            color = Color(0xff2B2B2B),
                        )
                    )
                    Text(
                        text = "Пройти до 24.09.2023",
                        style = TextStyle(
                            fontFamily = FontFamily(
                                Font(
                                    R.font.montserrat_regular,
                                ),
                            ),
                            fontWeight = FontWeight.Normal,
                            fontSize = 8.sp,
                            lineHeight = 14.sp,
                            color = Color(0xff929292),
                        )
                    )
                }
            }
            Box(
                modifier = Modifier.border(
                    1.5.dp,
                    color = Color(0xff2B2B2B),
                    shape = RoundedCornerShape(5.dp)
                ).size(20.dp)
            ) {
                Icon(
                    Icons.Filled.Done,
                    contentDescription = null,
                    modifier = Modifier.size(12.dp).align(Alignment.Center)
                )
            }
        }
    }
}