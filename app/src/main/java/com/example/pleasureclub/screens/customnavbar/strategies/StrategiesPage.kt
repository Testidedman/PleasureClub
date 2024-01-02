package com.example.pleasureclub.screens.customnavbar.strategies

import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import androidx.navigation.NavHostController
import com.example.pleasureclub.screens.items
import com.example.pleasureclub.widgets.StrategyCard

@Composable
fun StrategiesPage(navController: NavHostController) {
    LazyColumn(
        modifier = Modifier
            .padding(horizontal = 24.dp)
    ) {
        items (3) {
            StrategyCard(
                navController = navController
            )
        }
    }
}