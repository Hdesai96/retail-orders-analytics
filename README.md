# End-to-End Data Analytics Project: Retail Orders Analysis

A comprehensive data pipeline project demonstrating ETL (Extract, Transform, Load) processes and business analytics using Python and SQL.

## Project Overview

This project showcases a complete data analytics workflow, from raw data acquisition to actionable business insights. Using real-world retail order data, I implemented data cleaning, transformation, database integration, and analytical query development.

## Tech Stack

- **Python 3.12**
- **Pandas** - Data manipulation and cleaning
- **SQLAlchemy** - Database connectivity and ORM
- **PyMySQL** - MySQL database driver
- **MySQL** - Relational database for data storage and analysis
- **Jupyter Notebook** - Interactive development environment
- **Kaggle API** - Automated data acquisition

## Project Workflow

### 1. Data Acquisition
- Downloaded retail orders dataset from Kaggle using Kaggle API
- Automated data retrieval process for reproducibility

### 2. Data Cleaning & Transformation (Python)
- Handled missing values by specifying custom NA values ('Not Available', 'unknown')
- Normalized column names (lowercase, underscores instead of spaces)
- Derived new metrics:
  - **Discount**: Calculated from list price and discount percentage
  - **Sale Price**: List price minus discount
  - **Profit**: Sale price minus cost price
- Converted order_date to datetime format
- Dropped redundant columns after deriving necessary metrics

### 3. Data Loading
- Established connection to MySQL database using SQLAlchemy
- Created retail_db database
- Loaded cleaned data (9,994 rows) into df_orders table
- Implemented batch loading with chunking for performance
- Used multi-row insert method for efficiency

### 4. Data Analysis (SQL)
Developed SQL queries to answer key business questions:
- **Top 10 revenue-generating products** by total sales
- **Top 5 selling products by region** using window functions
- **Month-over-month sales growth** with LAG function and CTEs
- **Highest profit margin products** by category and subcategory
- **Regional performance analysis** including orders, revenue, and profit metrics

## Project Structure

```
retail-orders-analytics/
│
├── notebooks/
│   └── data_analysis.ipynb          # Main Jupyter notebook with all code
│
├── sql_queries/
│   └── business_analysis.sql        # SQL queries for data analysis
│
├── data/
│   └── README.md                    # Instructions for downloading data
│
├── requirements.txt                 # Python dependencies
│
└── README.md                        # Project documentation
```

## Setup Instructions

### Prerequisites
- Python 3.8 or higher
- MySQL Server (local or cloud instance)
- Kaggle account and API credentials

### Installation

1. Clone this repository:
```bash
git clone https://github.com/yourusername/retail-orders-analytics.git
cd retail-orders-analytics
```

2. Install required packages:
```bash
pip install -r requirements.txt
```

3. Set up Kaggle API:
   - Download your Kaggle API token from your Kaggle account settings
   - Place `kaggle.json` in `~/.kaggle/` directory
   - Set permissions: `chmod 600 ~/.kaggle/kaggle.json`

4. Configure database connection:
   - Update MySQL connection string in the notebook
   - Ensure MySQL Server is running and accessible

### Running the Project

1. Open Jupyter Notebook:
```bash
jupyter notebook
```

2. Navigate to `notebooks/data_analysis.ipynb`

3. Run cells sequentially to:
   - Download the dataset
   - Clean and transform data
   - Load data into MySQL database
   - Execute analytical queries

## Key Insights

- Identified top revenue-generating products and regions
- Analyzed seasonal trends and month-over-month growth patterns
- Discovered high-margin product categories for strategic focus
- Provided actionable recommendations based on data-driven insights

## Learning Outcomes

- Hands-on experience with the complete data analytics lifecycle
- Proficiency in Python data manipulation using Pandas
- Database integration and management skills
- Writing complex SQL queries for business analytics
- Best practices for data cleaning and validation
- Understanding the importance of data quality in analysis

## Future Enhancements

- Add data visualization dashboard using Power BI or Tableau
- Implement automated reporting pipeline
- Integrate predictive analytics for sales forecasting
- Create REST API for real-time data access
- Add unit tests for data validation functions

## Acknowledgments

This project was inspired by Ankit Bansal's tutorial on building end-to-end data analytics projects. The implementation and analysis are my own work.

## Contact

Harshni Desai   
Master's Student - Data Analytics & Information Systems  
Texas State University

- LinkedIn:https://www.linkedin.com/in/harshni-desai/
- Email:desai.harshni.d@gmail.com
- GitHub: https://github.com/Hdesai96/retail-orders-analytics

## License

This project is open source and available under the [MIT License](LICENSE).
