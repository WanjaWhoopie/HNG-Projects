### Introduction

In this blog, we are exploring the [Retail Dataset on Kaggle](https://www.kaggle.com/datasets/kyanyoga/sample-sales-data?resource=download). The dataset was originally used for Pentaho DI Kettle but represents a rich enough sample to practice data analysis on. This task is submitted as part of the [HNG internship](https://hng.tech/internship). It is an interesting challenge for techies to take up in data analysis, backend, frontend, design and several other tracks. The people that make it out are top notch talent and those looking to hire should head over to the [website](https://hng.tech/hire).


Below, we are going to read the file and have a quick view of the columns and datatypes. The dataset has 25 columns with 2823 rows.


```python
import pandas as pd
import matplotlib.pyplot as plt
```


```python
df = pd.read_csv("sales_data.csv", encoding='latin-1')
df.head()

```





  <div id="df-b39134f9-4f4d-4744-8cb3-70f0939e1189" class="colab-df-container">
    <div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>ORDERNUMBER</th>
      <th>QUANTITYORDERED</th>
      <th>PRICEEACH</th>
      <th>ORDERLINENUMBER</th>
      <th>SALES</th>
      <th>ORDERDATE</th>
      <th>STATUS</th>
      <th>QTR_ID</th>
      <th>MONTH_ID</th>
      <th>YEAR_ID</th>
      <th>...</th>
      <th>ADDRESSLINE1</th>
      <th>ADDRESSLINE2</th>
      <th>CITY</th>
      <th>STATE</th>
      <th>POSTALCODE</th>
      <th>COUNTRY</th>
      <th>TERRITORY</th>
      <th>CONTACTLASTNAME</th>
      <th>CONTACTFIRSTNAME</th>
      <th>DEALSIZE</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>10107</td>
      <td>30</td>
      <td>95.70</td>
      <td>2</td>
      <td>2871.00</td>
      <td>2/24/2003 0:00</td>
      <td>Shipped</td>
      <td>1</td>
      <td>2</td>
      <td>2003</td>
      <td>...</td>
      <td>897 Long Airport Avenue</td>
      <td>NaN</td>
      <td>NYC</td>
      <td>NY</td>
      <td>10022</td>
      <td>USA</td>
      <td>NaN</td>
      <td>Yu</td>
      <td>Kwai</td>
      <td>Small</td>
    </tr>
    <tr>
      <th>1</th>
      <td>10121</td>
      <td>34</td>
      <td>81.35</td>
      <td>5</td>
      <td>2765.90</td>
      <td>05/07/2003 00:00</td>
      <td>Shipped</td>
      <td>2</td>
      <td>5</td>
      <td>2003</td>
      <td>...</td>
      <td>59 rue de l'Abbaye</td>
      <td>NaN</td>
      <td>Reims</td>
      <td>NaN</td>
      <td>51100</td>
      <td>France</td>
      <td>EMEA</td>
      <td>Henriot</td>
      <td>Paul</td>
      <td>Small</td>
    </tr>
    <tr>
      <th>2</th>
      <td>10134</td>
      <td>41</td>
      <td>94.74</td>
      <td>2</td>
      <td>3884.34</td>
      <td>07/01/2003 00:00</td>
      <td>Shipped</td>
      <td>3</td>
      <td>7</td>
      <td>2003</td>
      <td>...</td>
      <td>27 rue du Colonel Pierre Avia</td>
      <td>NaN</td>
      <td>Paris</td>
      <td>NaN</td>
      <td>75508</td>
      <td>France</td>
      <td>EMEA</td>
      <td>Da Cunha</td>
      <td>Daniel</td>
      <td>Medium</td>
    </tr>
    <tr>
      <th>3</th>
      <td>10145</td>
      <td>45</td>
      <td>83.26</td>
      <td>6</td>
      <td>3746.70</td>
      <td>8/25/2003 0:00</td>
      <td>Shipped</td>
      <td>3</td>
      <td>8</td>
      <td>2003</td>
      <td>...</td>
      <td>78934 Hillside Dr.</td>
      <td>NaN</td>
      <td>Pasadena</td>
      <td>CA</td>
      <td>90003</td>
      <td>USA</td>
      <td>NaN</td>
      <td>Young</td>
      <td>Julie</td>
      <td>Medium</td>
    </tr>
    <tr>
      <th>4</th>
      <td>10159</td>
      <td>49</td>
      <td>100.00</td>
      <td>14</td>
      <td>5205.27</td>
      <td>10/10/2003 00:00</td>
      <td>Shipped</td>
      <td>4</td>
      <td>10</td>
      <td>2003</td>
      <td>...</td>
      <td>7734 Strong St.</td>
      <td>NaN</td>
      <td>San Francisco</td>
      <td>CA</td>
      <td>NaN</td>
      <td>USA</td>
      <td>NaN</td>
      <td>Brown</td>
      <td>Julie</td>
      <td>Medium</td>
    </tr>
  </tbody>
</table>
<p>5 rows × 25 columns</p>
</div>
    <div class="colab-df-buttons">

  <div class="colab-df-container">
    <button class="colab-df-convert" onclick="convertToInteractive('df-b39134f9-4f4d-4744-8cb3-70f0939e1189')"
            title="Convert this dataframe to an interactive table."
            style="display:none;">

  <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960">
    <path d="M120-120v-720h720v720H120Zm60-500h600v-160H180v160Zm220 220h160v-160H400v160Zm0 220h160v-160H400v160ZM180-400h160v-160H180v160Zm440 0h160v-160H620v160ZM180-180h160v-160H180v160Zm440 0h160v-160H620v160Z"/>
  </svg>
    </button>

  <style>
    .colab-df-container {
      display:flex;
      gap: 12px;
    }

    .colab-df-convert {
      background-color: #E8F0FE;
      border: none;
      border-radius: 50%;
      cursor: pointer;
      display: none;
      fill: #1967D2;
      height: 32px;
      padding: 0 0 0 0;
      width: 32px;
    }

    .colab-df-convert:hover {
      background-color: #E2EBFA;
      box-shadow: 0px 1px 2px rgba(60, 64, 67, 0.3), 0px 1px 3px 1px rgba(60, 64, 67, 0.15);
      fill: #174EA6;
    }

    .colab-df-buttons div {
      margin-bottom: 4px;
    }

    [theme=dark] .colab-df-convert {
      background-color: #3B4455;
      fill: #D2E3FC;
    }

    [theme=dark] .colab-df-convert:hover {
      background-color: #434B5C;
      box-shadow: 0px 1px 3px 1px rgba(0, 0, 0, 0.15);
      filter: drop-shadow(0px 1px 2px rgba(0, 0, 0, 0.3));
      fill: #FFFFFF;
    }
  </style>

    <script>
      const buttonEl =
        document.querySelector('#df-b39134f9-4f4d-4744-8cb3-70f0939e1189 button.colab-df-convert');
      buttonEl.style.display =
        google.colab.kernel.accessAllowed ? 'block' : 'none';

      async function convertToInteractive(key) {
        const element = document.querySelector('#df-b39134f9-4f4d-4744-8cb3-70f0939e1189');
        const dataTable =
          await google.colab.kernel.invokeFunction('convertToInteractive',
                                                    [key], {});
        if (!dataTable) return;

        const docLinkHtml = 'Like what you see? Visit the ' +
          '<a target="_blank" href=https://colab.research.google.com/notebooks/data_table.ipynb>data table notebook</a>'
          + ' to learn more about interactive tables.';
        element.innerHTML = '';
        dataTable['output_type'] = 'display_data';
        await google.colab.output.renderOutput(dataTable, element);
        const docLink = document.createElement('div');
        docLink.innerHTML = docLinkHtml;
        element.appendChild(docLink);
      }
    </script>
  </div>


<div id="df-94023217-897e-4066-8d53-9a3956edab89">
  <button class="colab-df-quickchart" onclick="quickchart('df-94023217-897e-4066-8d53-9a3956edab89')"
            title="Suggest charts"
            style="display:none;">

<svg xmlns="http://www.w3.org/2000/svg" height="24px"viewBox="0 0 24 24"
     width="24px">
    <g>
        <path d="M19 3H5c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zM9 17H7v-7h2v7zm4 0h-2V7h2v10zm4 0h-2v-4h2v4z"/>
    </g>
</svg>
  </button>

<style>
  .colab-df-quickchart {
      --bg-color: #E8F0FE;
      --fill-color: #1967D2;
      --hover-bg-color: #E2EBFA;
      --hover-fill-color: #174EA6;
      --disabled-fill-color: #AAA;
      --disabled-bg-color: #DDD;
  }

  [theme=dark] .colab-df-quickchart {
      --bg-color: #3B4455;
      --fill-color: #D2E3FC;
      --hover-bg-color: #434B5C;
      --hover-fill-color: #FFFFFF;
      --disabled-bg-color: #3B4455;
      --disabled-fill-color: #666;
  }

  .colab-df-quickchart {
    background-color: var(--bg-color);
    border: none;
    border-radius: 50%;
    cursor: pointer;
    display: none;
    fill: var(--fill-color);
    height: 32px;
    padding: 0;
    width: 32px;
  }

  .colab-df-quickchart:hover {
    background-color: var(--hover-bg-color);
    box-shadow: 0 1px 2px rgba(60, 64, 67, 0.3), 0 1px 3px 1px rgba(60, 64, 67, 0.15);
    fill: var(--button-hover-fill-color);
  }

  .colab-df-quickchart-complete:disabled,
  .colab-df-quickchart-complete:disabled:hover {
    background-color: var(--disabled-bg-color);
    fill: var(--disabled-fill-color);
    box-shadow: none;
  }

  .colab-df-spinner {
    border: 2px solid var(--fill-color);
    border-color: transparent;
    border-bottom-color: var(--fill-color);
    animation:
      spin 1s steps(1) infinite;
  }

  @keyframes spin {
    0% {
      border-color: transparent;
      border-bottom-color: var(--fill-color);
      border-left-color: var(--fill-color);
    }
    20% {
      border-color: transparent;
      border-left-color: var(--fill-color);
      border-top-color: var(--fill-color);
    }
    30% {
      border-color: transparent;
      border-left-color: var(--fill-color);
      border-top-color: var(--fill-color);
      border-right-color: var(--fill-color);
    }
    40% {
      border-color: transparent;
      border-right-color: var(--fill-color);
      border-top-color: var(--fill-color);
    }
    60% {
      border-color: transparent;
      border-right-color: var(--fill-color);
    }
    80% {
      border-color: transparent;
      border-right-color: var(--fill-color);
      border-bottom-color: var(--fill-color);
    }
    90% {
      border-color: transparent;
      border-bottom-color: var(--fill-color);
    }
  }
</style>

  <script>
    async function quickchart(key) {
      const quickchartButtonEl =
        document.querySelector('#' + key + ' button');
      quickchartButtonEl.disabled = true;  // To prevent multiple clicks.
      quickchartButtonEl.classList.add('colab-df-spinner');
      try {
        const charts = await google.colab.kernel.invokeFunction(
            'suggestCharts', [key], {});
      } catch (error) {
        console.error('Error during call to suggestCharts:', error);
      }
      quickchartButtonEl.classList.remove('colab-df-spinner');
      quickchartButtonEl.classList.add('colab-df-quickchart-complete');
    }
    (() => {
      let quickchartButtonEl =
        document.querySelector('#df-94023217-897e-4066-8d53-9a3956edab89 button');
      quickchartButtonEl.style.display =
        google.colab.kernel.accessAllowed ? 'block' : 'none';
    })();
  </script>
</div>

    </div>
  </div>





```python
df.shape
```




    (2823, 25)



Here are the different data types present.


```python
df.dtypes

```




    ORDERNUMBER           int64
    QUANTITYORDERED       int64
    PRICEEACH           float64
    ORDERLINENUMBER       int64
    SALES               float64
    ORDERDATE            object
    STATUS               object
    QTR_ID                int64
    MONTH_ID              int64
    YEAR_ID               int64
    PRODUCTLINE          object
    MSRP                  int64
    PRODUCTCODE          object
    CUSTOMERNAME         object
    PHONE                object
    ADDRESSLINE1         object
    ADDRESSLINE2         object
    CITY                 object
    STATE                object
    POSTALCODE           object
    COUNTRY              object
    TERRITORY            object
    CONTACTLASTNAME      object
    CONTACTFIRSTNAME     object
    DEALSIZE             object
    dtype: object



Next, we will look for empty cells in each column. The empty cells do not seem to be that impactful although they'd be useful in further analysis. In TERRITORY, the 1074 were for North America which was misinterpreted as Not A Number. The STATE column should be dropped if doing an analysis of all the orders. It'd only be useful for analysis of sales in the US.


```python
# Find empty cells
empty_cells = df.isnull().sum()

# Number of empty cells in each column
print(empty_cells)

```

    ORDERNUMBER            0
    QUANTITYORDERED        0
    PRICEEACH              0
    ORDERLINENUMBER        0
    SALES                  0
    ORDERDATE              0
    STATUS                 0
    QTR_ID                 0
    MONTH_ID               0
    YEAR_ID                0
    PRODUCTLINE            0
    MSRP                   0
    PRODUCTCODE            0
    CUSTOMERNAME           0
    PHONE                  0
    ADDRESSLINE1           0
    ADDRESSLINE2        2521
    CITY                   0
    STATE               1486
    POSTALCODE            76
    COUNTRY                0
    TERRITORY           1074
    CONTACTLASTNAME        0
    CONTACTFIRSTNAME       0
    DEALSIZE               0
    dtype: int64
    

This gives all the info together.


```python
df.info()

```

    <class 'pandas.core.frame.DataFrame'>
    RangeIndex: 2823 entries, 0 to 2822
    Data columns (total 25 columns):
     #   Column            Non-Null Count  Dtype  
    ---  ------            --------------  -----  
     0   ORDERNUMBER       2823 non-null   int64  
     1   QUANTITYORDERED   2823 non-null   int64  
     2   PRICEEACH         2823 non-null   float64
     3   ORDERLINENUMBER   2823 non-null   int64  
     4   SALES             2823 non-null   float64
     5   ORDERDATE         2823 non-null   object 
     6   STATUS            2823 non-null   object 
     7   QTR_ID            2823 non-null   int64  
     8   MONTH_ID          2823 non-null   int64  
     9   YEAR_ID           2823 non-null   int64  
     10  PRODUCTLINE       2823 non-null   object 
     11  MSRP              2823 non-null   int64  
     12  PRODUCTCODE       2823 non-null   object 
     13  CUSTOMERNAME      2823 non-null   object 
     14  PHONE             2823 non-null   object 
     15  ADDRESSLINE1      2823 non-null   object 
     16  ADDRESSLINE2      302 non-null    object 
     17  CITY              2823 non-null   object 
     18  STATE             1337 non-null   object 
     19  POSTALCODE        2747 non-null   object 
     20  COUNTRY           2823 non-null   object 
     21  TERRITORY         1749 non-null   object 
     22  CONTACTLASTNAME   2823 non-null   object 
     23  CONTACTFIRSTNAME  2823 non-null   object 
     24  DEALSIZE          2823 non-null   object 
    dtypes: float64(2), int64(7), object(16)
    memory usage: 551.5+ KB
    

We will also check basic statistics for the numerical columns. Note, all numerical columns are picked and the formula does not discriminate IDs. Converting IDs to categorical columns to avoid numerical manipulation could be useful.


```python
df.describe()
```





  <div id="df-1808305d-5572-4a0f-b579-b54ce8dfe89d" class="colab-df-container">
    <div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>ORDERNUMBER</th>
      <th>QUANTITYORDERED</th>
      <th>PRICEEACH</th>
      <th>ORDERLINENUMBER</th>
      <th>SALES</th>
      <th>QTR_ID</th>
      <th>MONTH_ID</th>
      <th>YEAR_ID</th>
      <th>MSRP</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>count</th>
      <td>2823.000000</td>
      <td>2823.000000</td>
      <td>2823.000000</td>
      <td>2823.000000</td>
      <td>2823.000000</td>
      <td>2823.000000</td>
      <td>2823.000000</td>
      <td>2823.00000</td>
      <td>2823.000000</td>
    </tr>
    <tr>
      <th>mean</th>
      <td>10258.725115</td>
      <td>35.092809</td>
      <td>83.658544</td>
      <td>6.466171</td>
      <td>3553.889072</td>
      <td>2.717676</td>
      <td>7.092455</td>
      <td>2003.81509</td>
      <td>100.715551</td>
    </tr>
    <tr>
      <th>std</th>
      <td>92.085478</td>
      <td>9.741443</td>
      <td>20.174277</td>
      <td>4.225841</td>
      <td>1841.865106</td>
      <td>1.203878</td>
      <td>3.656633</td>
      <td>0.69967</td>
      <td>40.187912</td>
    </tr>
    <tr>
      <th>min</th>
      <td>10100.000000</td>
      <td>6.000000</td>
      <td>26.880000</td>
      <td>1.000000</td>
      <td>482.130000</td>
      <td>1.000000</td>
      <td>1.000000</td>
      <td>2003.00000</td>
      <td>33.000000</td>
    </tr>
    <tr>
      <th>25%</th>
      <td>10180.000000</td>
      <td>27.000000</td>
      <td>68.860000</td>
      <td>3.000000</td>
      <td>2203.430000</td>
      <td>2.000000</td>
      <td>4.000000</td>
      <td>2003.00000</td>
      <td>68.000000</td>
    </tr>
    <tr>
      <th>50%</th>
      <td>10262.000000</td>
      <td>35.000000</td>
      <td>95.700000</td>
      <td>6.000000</td>
      <td>3184.800000</td>
      <td>3.000000</td>
      <td>8.000000</td>
      <td>2004.00000</td>
      <td>99.000000</td>
    </tr>
    <tr>
      <th>75%</th>
      <td>10333.500000</td>
      <td>43.000000</td>
      <td>100.000000</td>
      <td>9.000000</td>
      <td>4508.000000</td>
      <td>4.000000</td>
      <td>11.000000</td>
      <td>2004.00000</td>
      <td>124.000000</td>
    </tr>
    <tr>
      <th>max</th>
      <td>10425.000000</td>
      <td>97.000000</td>
      <td>100.000000</td>
      <td>18.000000</td>
      <td>14082.800000</td>
      <td>4.000000</td>
      <td>12.000000</td>
      <td>2005.00000</td>
      <td>214.000000</td>
    </tr>
  </tbody>
</table>
</div>
    <div class="colab-df-buttons">

  <div class="colab-df-container">
    <button class="colab-df-convert" onclick="convertToInteractive('df-1808305d-5572-4a0f-b579-b54ce8dfe89d')"
            title="Convert this dataframe to an interactive table."
            style="display:none;">

  <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960">
    <path d="M120-120v-720h720v720H120Zm60-500h600v-160H180v160Zm220 220h160v-160H400v160Zm0 220h160v-160H400v160ZM180-400h160v-160H180v160Zm440 0h160v-160H620v160ZM180-180h160v-160H180v160Zm440 0h160v-160H620v160Z"/>
  </svg>
    </button>

  <style>
    .colab-df-container {
      display:flex;
      gap: 12px;
    }

    .colab-df-convert {
      background-color: #E8F0FE;
      border: none;
      border-radius: 50%;
      cursor: pointer;
      display: none;
      fill: #1967D2;
      height: 32px;
      padding: 0 0 0 0;
      width: 32px;
    }

    .colab-df-convert:hover {
      background-color: #E2EBFA;
      box-shadow: 0px 1px 2px rgba(60, 64, 67, 0.3), 0px 1px 3px 1px rgba(60, 64, 67, 0.15);
      fill: #174EA6;
    }

    .colab-df-buttons div {
      margin-bottom: 4px;
    }

    [theme=dark] .colab-df-convert {
      background-color: #3B4455;
      fill: #D2E3FC;
    }

    [theme=dark] .colab-df-convert:hover {
      background-color: #434B5C;
      box-shadow: 0px 1px 3px 1px rgba(0, 0, 0, 0.15);
      filter: drop-shadow(0px 1px 2px rgba(0, 0, 0, 0.3));
      fill: #FFFFFF;
    }
  </style>

    <script>
      const buttonEl =
        document.querySelector('#df-1808305d-5572-4a0f-b579-b54ce8dfe89d button.colab-df-convert');
      buttonEl.style.display =
        google.colab.kernel.accessAllowed ? 'block' : 'none';

      async function convertToInteractive(key) {
        const element = document.querySelector('#df-1808305d-5572-4a0f-b579-b54ce8dfe89d');
        const dataTable =
          await google.colab.kernel.invokeFunction('convertToInteractive',
                                                    [key], {});
        if (!dataTable) return;

        const docLinkHtml = 'Like what you see? Visit the ' +
          '<a target="_blank" href=https://colab.research.google.com/notebooks/data_table.ipynb>data table notebook</a>'
          + ' to learn more about interactive tables.';
        element.innerHTML = '';
        dataTable['output_type'] = 'display_data';
        await google.colab.output.renderOutput(dataTable, element);
        const docLink = document.createElement('div');
        docLink.innerHTML = docLinkHtml;
        element.appendChild(docLink);
      }
    </script>
  </div>


<div id="df-794b7fb2-acec-4f4a-af93-b6bdd8b0db30">
  <button class="colab-df-quickchart" onclick="quickchart('df-794b7fb2-acec-4f4a-af93-b6bdd8b0db30')"
            title="Suggest charts"
            style="display:none;">

<svg xmlns="http://www.w3.org/2000/svg" height="24px"viewBox="0 0 24 24"
     width="24px">
    <g>
        <path d="M19 3H5c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zM9 17H7v-7h2v7zm4 0h-2V7h2v10zm4 0h-2v-4h2v4z"/>
    </g>
</svg>
  </button>

<style>
  .colab-df-quickchart {
      --bg-color: #E8F0FE;
      --fill-color: #1967D2;
      --hover-bg-color: #E2EBFA;
      --hover-fill-color: #174EA6;
      --disabled-fill-color: #AAA;
      --disabled-bg-color: #DDD;
  }

  [theme=dark] .colab-df-quickchart {
      --bg-color: #3B4455;
      --fill-color: #D2E3FC;
      --hover-bg-color: #434B5C;
      --hover-fill-color: #FFFFFF;
      --disabled-bg-color: #3B4455;
      --disabled-fill-color: #666;
  }

  .colab-df-quickchart {
    background-color: var(--bg-color);
    border: none;
    border-radius: 50%;
    cursor: pointer;
    display: none;
    fill: var(--fill-color);
    height: 32px;
    padding: 0;
    width: 32px;
  }

  .colab-df-quickchart:hover {
    background-color: var(--hover-bg-color);
    box-shadow: 0 1px 2px rgba(60, 64, 67, 0.3), 0 1px 3px 1px rgba(60, 64, 67, 0.15);
    fill: var(--button-hover-fill-color);
  }

  .colab-df-quickchart-complete:disabled,
  .colab-df-quickchart-complete:disabled:hover {
    background-color: var(--disabled-bg-color);
    fill: var(--disabled-fill-color);
    box-shadow: none;
  }

  .colab-df-spinner {
    border: 2px solid var(--fill-color);
    border-color: transparent;
    border-bottom-color: var(--fill-color);
    animation:
      spin 1s steps(1) infinite;
  }

  @keyframes spin {
    0% {
      border-color: transparent;
      border-bottom-color: var(--fill-color);
      border-left-color: var(--fill-color);
    }
    20% {
      border-color: transparent;
      border-left-color: var(--fill-color);
      border-top-color: var(--fill-color);
    }
    30% {
      border-color: transparent;
      border-left-color: var(--fill-color);
      border-top-color: var(--fill-color);
      border-right-color: var(--fill-color);
    }
    40% {
      border-color: transparent;
      border-right-color: var(--fill-color);
      border-top-color: var(--fill-color);
    }
    60% {
      border-color: transparent;
      border-right-color: var(--fill-color);
    }
    80% {
      border-color: transparent;
      border-right-color: var(--fill-color);
      border-bottom-color: var(--fill-color);
    }
    90% {
      border-color: transparent;
      border-bottom-color: var(--fill-color);
    }
  }
</style>

  <script>
    async function quickchart(key) {
      const quickchartButtonEl =
        document.querySelector('#' + key + ' button');
      quickchartButtonEl.disabled = true;  // To prevent multiple clicks.
      quickchartButtonEl.classList.add('colab-df-spinner');
      try {
        const charts = await google.colab.kernel.invokeFunction(
            'suggestCharts', [key], {});
      } catch (error) {
        console.error('Error during call to suggestCharts:', error);
      }
      quickchartButtonEl.classList.remove('colab-df-spinner');
      quickchartButtonEl.classList.add('colab-df-quickchart-complete');
    }
    (() => {
      let quickchartButtonEl =
        document.querySelector('#df-794b7fb2-acec-4f4a-af93-b6bdd8b0db30 button');
      quickchartButtonEl.style.display =
        google.colab.kernel.accessAllowed ? 'block' : 'none';
    })();
  </script>
</div>

    </div>
  </div>




## Observations

In the next part, we look for anomalies like duplicate rows, financial columns being in the negative, or quantities ordered being greater than 100.


```python
# Check for duplicate rows
duplicate_rows = df[df.duplicated()]

# Check for outliers in the quantity column
outliers = df[df['QUANTITYORDERED'] > 100]

# Check for negative values in a few price columns
negative_prices = df[df['PRICEEACH'] < 0]
negative_prices2 = df[df['SALES'] < 0]

# Print the number of anomalies found
print("Number of duplicate rows:", len(duplicate_rows))
print("Number of outliers in quantity:", len(outliers))
print("Number of negative values in unit price:", len(negative_prices))
print("Number of negative values in Sales:", len(negative_prices))
```

    Number of duplicate rows: 0
    Number of outliers in quantity: 0
    Number of negative values in unit price: 0
    Number of negative values in Sales: 0
    

There were no anomalies in the dataset.

In terms of frequency, the deals are mostly medium with the average sale being 3553.


```python
df['DEALSIZE'].value_counts().plot(kind='bar')
```




    <Axes: xlabel='DEALSIZE'>




    
![png](output_19_1.png)
    


Mean sales for each product line can be seen in the graph below. The average difference between Trains (lowest) and Classic Cars (Highest), seems to be a 1000.


```python
plt.figure(figsize=(12, 6))
df.groupby('PRODUCTLINE')['SALES'].mean().plot(kind='bar')
```




    <Axes: xlabel='PRODUCTLINE'>




    
![png](output_21_1.png)
    


There was a sales increase between 2003 and 2004 then a dip in 2005.


```python
df['YEAR_ID'].value_counts()
```




    YEAR_ID
    2004    1345
    2003    1000
    2005     478
    Name: count, dtype: int64




```python
df['YEAR_ID'].value_counts().plot(kind='bar')
plt.show()

```


    
![png](output_24_0.png)
    


## Conclusion

Further analysis could help us find out why the cells were empty for STATE and TERRITORY and if the information can be found in other ways. This also helps the team ensure integrity in data entry is adhered to during data collection in other projects.

An investigation should also be done to evaluate any reasons behind the deep in 2005. Was the data collected throughout the year? Was there a financial crisis? Is it something in the supply chain? These would be some appropriate questions to ask.

I'd also reccomend analysis that touches on correlation between the different columns.
