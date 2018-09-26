# tRNA_fitness_landscape
Jianzhi Zhang lab project

# ExpData

## Add GtRNAdb data:

GtRNAdb_Arg_CCT_all + ExpData_0.5_1770: <br>
![](pictures/latent_space_dim_z_2_wd_0.01_1000g1000b.png) <br>
![](pictures/latent_space_dim_z_2_wd_0.01_39000.png) <br>
final training loss: 29.50;  cross validation loss: ? <br>
mean 10-fold cross validation PCC: 0.188, PCC_train: 0.202, PCC_test: 0.243 <br>

GtRNAdb_Arg_CCT_all:

![](pictures/latent_space_dim_z_2_wd_0.01_1000g1000b_GtRNAdb_Arg_CCT_all.png) <br>
red: 1000good (fitness>0.5); blue: 1000bad (fitness<=0.5) <br>

![](pictures/latent_space_dim_z_2_wd_0.01_test.png) <br>
red: GtRNAdb seqs; blue: ExpData <br>
final training loss: 32.959224700927734;  cross validation loss: 57.80743408203125



<br>
Arg - CTT: <br>
4899 -> exclude duplicates -> 1910 <br>


## Training size:

Using the same VAE training set:

| subset                | 12000_d1 | 12000_d2 | 12000_d3 | 12000_d4 | 12000_d5 | 12000_0 |
|-----------------------|----------|----------|----------|----------|----------|---------|
| train loss            | 15.923   | 15.923   | 15.924   | 15.925   | 15.924   | 15.923  |
| cross validation loss | 15.976   | 15.975   | 15.974   | 15.977   | 15.975   | 15.973  |
| cross validation PCC  | 0.348    | 0.484    | 0.449    | 0.431    | 0.503    | 0.593   |
| training PCC          | 0.351    | 0.486    | 0.448    | 0.439    | 0.512    | 0.594   |
| test PCC              | 0.367    | 0.458    | 0.428    | 0.472    | 0.566    | 0.641   |


12000 VAE model

| VAE training set      | 12000_1 | 12000_2 | 12000_3 | 12000_4 | 12000_5 | 12000_0 |
|-----------------------|---------|---------|---------|---------|---------|---------|
| train loss            | 16.017  | 15.990  | 16.020  | 15.976  | 15.940  | 15.923  |
| cross validation loss | 15.969  | 15.963  | 15.969  | 15.969  | 15.973  | 15.973  |
| cross validation PCC  | 0.329   | 0.498   | 0.409   | 0.606   | 0.172   | 0.593   |
| training PCC          | 0.334   | 0.499   | 0.414   | 0.610   | 0.183   | 0.594   |
| test PCC              | 0.338   | 0.484   | 0.457   | 0.616   | 0.208   | 0.641   |

<br>

12000 VAE model:

| GP training set      | 1     | 2     | 3     | 4     | 5     | 0     |
|----------------------|-------|-------|-------|-------|-------|-------|
| cross validation PCC | 0.595 | 0.562 | 0.565 | 0.527 | 0.559 | 0.593 |
| training PCC         | 0.605 | 0.569 | 0.574 | 0.543 | 0.567 | 0.594 |
| test PCC             | 0.565 | 0.583 | 0.599 | 0.517 | 0.579 | 0.641 |


| training set          | 10000  | 12000  | 14000  | 16000  | 18000  | 20316  |
|-----------------------|--------|--------|--------|--------|--------|--------|
| traning loss          | 11.582 | 15.923 | 15.941 | 16.030 | 15.974 | 15.974 |
| cross validation loss | 16.250 | 15.973 | 15.977 | 15.974 | 15.977 | 15.973 |
| training PCC          | 0.249  | 0.594  | 0.377  | 0.645  | 0.546  | 0.335  |
| cros validation PCC   | 0.239  | 0.593  | 0.367  | 0.640  | 0.539  | 0.281  |
| test PCC              | 0.202  | 0.641  | 0.388  | 0.585  | 0.541  | 0.342  |

## Sample Visualization

![](pictures/ExpData_good_distribution_each.png)
Distribution of high fitness (>0.5) sequences
![](pictures/ExpData_good_distribution_stacked.png)
Distribution of high fitness (>0.5) sequences (stacked histogram)
![](pictures/ExpData_distribution_stacked.png)
Distribution of all sample (stacked histogram)

fitness = 0.5 : 27837 <br>
fitness > 0.5 : 21316 <br>
fitness > 0.6 : 13649 <br>
fitness > 0.7 : 7886 <br>
fitness > 0.8 : 4492 <br>
fitness > 0.9 : 2365 <br>
fitness > 1.0 : 745 <br>

<br><br>
# Simulated Data

## latent space visualization 
![](pictures/latent_space_dim_z_10_wd_0.01_1000g1000b.png)

1000 good sequences + 1000 bad sequences mapped to 10d latent space

## Decoder Accuracy

dim_z = 10

random error: mean = 7.371, std = 1.765, sample_size = 1000  #randomly choose 2 sequences from training set, calculate the average number of mismatch.<br>
predict error: mean = 3.796, std = 1.260, sample_size = 2000 <br>
Ttest_indResult(statistic=-57.15380896418932, pvalue=0.0)
<br><br>

predict error for good sequences: mean = 3.501, std = 1.170, sample_size = 1000 <br>
predict error for bad sequences: mean = 4.091, std = 1.277, sample_size = 1000 <br>
Ttest_indResult(statistic=-10.76520151991619, pvalue=2.638240089929478e-26)

## Encoder Sigma

training subset: 1000g1000b
dim_z = 10
sigma^2 = \[0.64629585, 0.99972963, 0.99992007, 0.99569345, 0.9600127, 0.99940825, 0.99990076, 0.9999758 , 0.9998213 , 0.9997909 \]

training set:
dim_z =10
sigma^2 = \[0.6439823 , 0.99970835, 0.9999718 , 0.99553096, 0.9604204, 0.9993257 , 0.9998293 , 1.0000199 , 0.9998647 , 0.9997776 \]

testset:
dim_z = 2
sigma^2 = \[0.63487, 0.8513085\]

training set:
dim_z = 2
sigma^2 = \[0.73748964, 0.84963286\]

## gaussian process

size_z = 10, 1000 good (training set) + 1000 bad:

mean 10-fold cross validation PCC: 0.747

PCC_train: 0.824, PCC_test: 0.670

MAD_train: 0.1, MAD_test: 0.1


size_z = 10, 2000 good in training set:

mean 10-fold cross validation PCC: 0.572

PCC_train: 0.653, PCC_test: 0.467

MAD_train: 0.1, MAD_test: 0.1


size_z = 2, 1000 good in test set:

mean 10-fold cross validation PCC: 0.575

PCC_train: 0.691, PCC_test: 0.502

MAD_train: 0.1, MAD_test: 0.1




| mutation num             | 1      | 2      | 3      | 4      | 5      | 6      | 7      | 8     | 9     |
|--------------------------|--------|--------|--------|--------|--------|--------|--------|-------|-------|
| good                     | 5      | 898    | 7471   | 4216   | 1960   | 775    | 243    | 57    | 12    |
| total                    | 216    | 23004  | 187997 | 119937 | 64999  | 30000  | 11000  | 3500  | 1000  |
| good ratio (fitness>270) | 0.0231 | 0.0390 | 0.0397 | 0.0351 | 0.0301 | 0.0258 | 0.0221 | 0.016 | 0.012 |


## Sample Visualization

![](pictures/good_distribution.png)
Distribution of high fitness (>270) sequences
![](pictures/all_data_distribution_stack_hist.png)
Distribution of all sample (stacked histogram)
![](pictures/all_data_distribution.png)
Distribution of all sample
