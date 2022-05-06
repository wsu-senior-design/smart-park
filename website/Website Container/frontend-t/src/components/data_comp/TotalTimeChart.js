import React, { useState } from "react";
import { Line } from "react-chartjs-2";
import { TotalTimeUserData } from "./ChartData";
// eslint-disable-next-line no-unused-vars
import { Chart as ChartJS } from "chart.js/auto";

function LineChart({ chartData }) {
  return <Line data={chartData} />;
}

function TTChart() {
  const [userData] = useState({
    labels: TotalTimeUserData.map((data) => data.Day),
    datasets: [
      {
        label: "Spot #1: Total Time Filled",
        data: TotalTimeUserData.map((data) => data.Time),
        backgroundColor: [
          "rgba(75,192,192,1)",
          "#ecf0f1",
          "#50AF95",
          "#f3ba2f",
          "#2a71d0",
        ],
        borderColor: "black",
        borderWidth: 2,
      },
    ],
  });

  
   
  return (
    <div>
      <div style={{ width: 700 }}>
        <LineChart chartData={userData} 
        options={{

        }}
        />
      </div>
    
    </div>
  );
}

export default TTChart;
