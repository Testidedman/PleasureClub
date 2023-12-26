package com.example.pleasureclub.screens

import androidx.annotation.DrawableRes
import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.material.BottomNavigation
import androidx.compose.material.BottomNavigationItem
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.ColorFilter
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.Font
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.navigation.NavDestination.Companion.hierarchy
import androidx.navigation.NavGraph.Companion.findStartDestination
import androidx.navigation.NavHostController
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.currentBackStackEntryAsState
import androidx.navigation.compose.rememberNavController
import com.example.pleasureclub.R
import com.example.pleasureclub.data.scaledSp
import com.example.pleasureclub.screens.customnavbar.main.MainPage
import com.example.pleasureclub.screens.customnavbar.strategies.StrategiesPage
import com.example.pleasureclub.screens.customnavbar.training.TrainingPage

sealed class Screen(val route: String, @DrawableRes var resourceId: Int) {
    data object Main : Screen("Главная", R.drawable.main,)
    data object Training : Screen("Обучение", R.drawable.training,)
    data object Strategies : Screen("Стратегии", R.drawable.strategies,)
    data object Trainers : Screen("Тренажеры", R.drawable.trainers,)
    data object Analytics : Screen("Аналитика", R.drawable.analytics,)
}

val items = listOf(
    Screen.Main,
    Screen.Training,
    Screen.Strategies,
    Screen.Trainers,
    Screen.Analytics,
)

@Composable
fun CustomNavbar(navController: NavHostController) {
    val bottomNavbarController = rememberNavController()
    Scaffold(
        bottomBar = {
            BottomNavigation(
                backgroundColor = Color(0xffFFFFFF),
            ) {
                val navBackStackEntry by bottomNavbarController.currentBackStackEntryAsState()
                val currentDestination = navBackStackEntry?.destination
                items.forEach { screen ->
                    BottomNavigationItem(
                        icon = {
                            Image(
                                painter = painterResource(id = screen.resourceId),
                                contentDescription = null,
                                colorFilter = ColorFilter.tint(
                                    color = if (currentDestination?.route == screen.route) Color(
                                        0xff2A2A2A
                                    ) else Color(0xffB8B8B8),
                                ),
                                modifier = Modifier
                                    .size(
                                        height = 24.dp,
                                        width = 24.dp,
                                    )
                            )
                        },
                        label = {
                            Text(
                                text = screen.route,
                                maxLines = 1,
                                style = TextStyle(
                                    fontFamily = FontFamily(
                                        Font(
                                            R.font.sfprotext_bold,
                                        ),
                                    ),
                                    fontWeight = FontWeight.Bold,
                                    fontSize = 10.scaledSp,
                                    lineHeight = 11.93.scaledSp,
                                    letterSpacing = (-0.24).scaledSp,
                                    color = if (currentDestination?.route == screen.route) Color(
                                        0xff2A2A2A
                                    ) else Color(0xffB8B8B8),
                                )
                            )
                        },
                        selected = currentDestination?.hierarchy?.any { it.route == screen.route } == true,
                        onClick = {
                            bottomNavbarController.navigate(screen.route) {
                                // Pop up to the start destination of the graph to
                                // avoid building up a large stack of destinations
                                // on the back stack as users select items
                                popUpTo(bottomNavbarController.graph.findStartDestination().id) {
                                    saveState = true
                                }
                                // Avoid multiple copies of the same destination when
                                // reselecting the same item
                                launchSingleTop = true
                                // Restore state when reselecting a previously selected item
                                restoreState = true
                            }
                        },
                    )
                }
            }
        }
    ) { innerPadding ->
        NavHost(
            bottomNavbarController,
            startDestination = Screen.Main.route,
            Modifier.padding(innerPadding)
        ) {
            composable(Screen.Main.route) { MainPage(navController) }
            composable(Screen.Training.route) { TrainingPage(navController) }
            composable(Screen.Strategies.route) { StrategiesPage(navController) }
            composable(Screen.Trainers.route) { Text(text = "lasdf") }
            composable(Screen.Analytics.route) { Text(text = "lasdf") }
        }
    }
}