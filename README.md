# Backbone_GPR

This package predicts Reinforced Concrete Parameters based on member’s material and geometric properties based on Gaussian Process Regression as proposed by Rayjada et al.(2023).These parameters include backbone curve parameters encompassing the member’s response under loading and energy dissipation. Lognormal prediction uncertainty estimates can also be obtained.

# Installation Modes
This package can be executed either by in-house MATLAB app or directly using MATLAB scripts containing fitted models and used as backend of the application.

## 1. Application
The app can be accessed in two way 

1. MATLAB Package 
[Backbone_GPR.mlappinstall](https://github.com/Satwikpr/Backbone_GPR/blob/b226f6902d2f71de441463df1b32fbb1397c7a77/Backbone_GPR.mlappinstall) is a package file that can be imported in MATLAB. It requires MATLAB and the necessary toolbox installed in the system. The app appears in the Apps tab in the MATLAB Toolstrip.
2. MATLAB Standalone Desktop Application
[GPR_Backbone_Standalone.rar](https://github.com/Satwikpr/Backbone_GPR/blob/d5839f564182ceb70ad23e1037fc794b2f0c89ea/GPR_Backbone_Standalone.rar) use this file if MATLAB is not installed in the system. However, this MATLAB Runtime must be installed already. To know more.
## 2. MATLAB Script
The folder [Scripts](https://github.com/Satwikpr/Backbone_GPR/tree/main/Script) contains separate GPR Models fitted for each parameter and related files for scaling and centering of the predictor variables. To obtain the required results, the user should only run the Matlab script named driver.m. Input should be given through spreadsheet named [input_data_14_var.xlsx](https://github.com/Satwikpr/Backbone_GPR/blob/17418e4aec081d50feee41ab044da189370b3cff/Script/input_data_14_var.xlsx) and [input_data_for_My.xlsx](https://github.com/Satwikpr/Backbone_GPR/blob/8d4681e62e7a19a2f88fea200b2dbf04926c19a7/Script/input_data_for_My.xlsx). Only derived predictor variables should be included in the spreadsheet [See Example for More Info](https://github.com/Satwikpr/Backbone_GPR/blob/74217dd06238b5061771eee189558c43fe4eae29/Doc/Example_calculation.md).

# How to use 
This application predicts the beam-column model parameters based on the geometric and material properties of the column.Based on the recommendations provided by Haselton et al. (2016), 14 predictor variables are considered. Models are fitted based on these predictor variables. Many of the predictor variables are derived based on primary sectional properties. So this app provides two options to input variables.

* **Option 1:** Using Basic Variables 
Users can input primary material and geometric properties. The required parameters are calculated in the back end. However, this option is not available if a user uses MATLAB script. 
* **Option 2:** Using Derived variables 
A user can directly input required variables as well using this option. 

!![image](https://user-images.githubusercontent.com/66442506/148634990-340c7d68-e72e-473b-b3a1-7ef73e099be0.png)

# Example: Modelling Column cross sections with both options

The column cross-section details are given in the figure below. The dimension of the column is 22’’ × 22’’ (560 mm ×  560 mm) with a 40 mm clear cover provided in all the directions. The height of the column is 13 ft ( ≈ 4000 mm). The end conditions are assumed to be fixed-fixed. 


The column is designed to resist the factored axial load of 685 kN. Here, a column is designed for the uniaxial bending. The backbone curve obtained from this approach is often used for 2-D analysis using lumped plasticity model. Hence, the uniaxial bending assumption is valid in the majority of cases. 5 No. of #7 longitudinal rebars are used at the top and bottom to resist bending, as shown in the figures. 5 No. of ties of #4 rebars are used as transverse reinforcement. 
 
<p align="center">
<img src = https://user-images.githubusercontent.com/66442506/148672678-89a9d141-883a-49e3-b89a-eb3f151155c7.png width="460" height="260">
<\p> 

Based on the standard cylinder test, the compressive strength of unconfined concrete is 5 ksi (≈34.5 MPa). At the same time, the yield stress of longitudinal and transverse reinforcement is 67 ksi (≈462 MPa) and 60 ksi (≈414 MPa), respectively. 

## Option 1 – Using Basic Parameters
### Inputs 
1. Cross section depth - mm (*H*) = 560
  
2. Cross section width - mm (*B*) = 560
  
3. Effective depth - mm (*d*) = 495 
  
	*d* = 560 – 65 = 495 mm
  
4. Distance of the center of the rebar from the extreme fiber -mm(*d'*) = 65 
  
5. Shear Span – mm (*L<sub>s</sub>*) = 2000 
 
	For fixed-fixed case, *L<sub>s</sub>*= (Length of column (*L*))/2=4000/2=2000 mm
  
6. Concrete compressive strength -MPa (*f<sub>c</sub>*) = 34.5 
  
7. Longitudinal reinforcement yield strength -MPa (*f<sub>y</sub>*) = 492 
  
8. Axial load- kN (*P*) = 685 
  
9. Number of rebars in tension zone (*N<sub>t</sub>*) = 5

10. Number of rebars in compression zone (*N<sub>c</sub>*) = 5
	
11. Maximum diameter of longitudinal rebar - mm (*d<sub>b</sub>*) = 22.225 
	
12. Maximum diameter of transverse ties - mm (*d<sub>t</sub>*) = 12.7 
	
13. Number of transverse ties (*N<sub>t</sub>*) = 5
	
14. Transverse reinforcement yield stress - MPa (*f<sub>y,sh</sub>*) = 685
	
15. Transverse reinforcement spacing - mm (s) = 125
	
16. Indicator variable for the possibility of rebar slip (*α<sub>sl</sub>*) =1
	
### Implementation

**Press 'Calculate'**

![Screenshot (901)](https://user-images.githubusercontent.com/66442506/148811563-e0a02f9d-e7f2-4548-94ca-5258e9de3f3d.png)

  
## Option 2 – Using Derived Parameters 
### Inputs

1. Cross section depth - mm (*H*) = 560
  
2. Cross section width - mm (*B*) = 560
  
3. Effective depth - mm (*d*) = 495 

3. Concrete compressive strength -MPa (*f<sub>c</sub>*) = 34.5 
	
4. Longitudinal reinforcement yield strength -MPa (*f<sub>y</sub>*) = 462 

11. Transverse reinforcement yield stress - MPa (*f<sub>y,sh</sub>*) = 411
	
6. Maximum diameter of longitudinal rebar - mm (*d<sub>b</sub>*) = 22.225 

1. Shear span to effective depth ratio (*L<sub>s</sub>/H*) = 3.57
	
	*L<sub>s</sub>*=2000 mm (fixed-fixed);*H*=560 mm;*L<sub>s</sub>/H*=3.57
	
2. Axial load ratio (*v*) = 0.0633
	
   * Gross cross section area *A*=*B*×*H*=560<sup>2</sup>=313660 mm<sup>2</sup>

   * Axial load (*P*)=685 kN
	
   * Concrete compressive strength (*f<sub>c</sub>*)=34.5 Mpa
	
   * Axial load ratio (v)= *P*/(*f<sub>c</sub>*×*A<sub>g</sub>*) =685000/(34.5×313660)=0.0633

8. Transverse reinforcement area - sq. mm (*A<sub>sh</sub>*) = 
    * Diameter of tranverse bar (*d<sub>sh</sub>*)= 12.7 mm; 
	
    * Number of transverse ties (*N<sub>sh</sub>*)= 5
	
    * *A<sub>sh</sub>*=(π/4×*d<sub>sh</sub>*<sup>2</sup>*N<sub>sh</sub>*)=633.38 mm<sup>2</sup>
	
5. Longitudinal reinforcement ratio (*ρ*) = 0.014

    * Number of rebars in tension zone (*N<sub>t</sub>*)= 5
	
    * Number of rebars in compression zone (*N<sub>t</sub>*) = 5
     
    * Diameter of bar (*d<sub>b</sub>*)= 22.225 mm
	
    * Tensile reinforcemnt ratio(*ρ<sub>t</sub>*)=compression.reinforcement ratio (*ρ<sub>c</sub>*)
   
    * *ρ<sub>t</sub>*=*ρ<sub>c</sub>* = (π/4×*d<sub>b</sub>*<sup>2</sup>*N<sub>t</sub>*)/*A<sub>g</sub>* =0.007
	
    * *ρ* = *ρ<sub>t</sub>* + *ρ<sub>c</sub>* = 0.014 
	
9. Transverse reinforcement ratio (*ρ<sub>sh</sub>*) = 0.009
    
    * *ρ<sub>sh</sub>*=*A<sub>sh</sub>*/*b<sub>s</sub>*=0.009
	
10. Effective transverse reinforcement ratio (*ρ<sub>sh,eff</sub>*)= 0.106
	
    * *ρ<sub>sh,eff</sub>*=*ρ<sub>sh</sub>* × *f<sub>y,sh</sub>*/*f<sub>c</sub>* =0.106
	
7. Rebar buckling coefficient (*S<sub>n</sub>*)
	
    * Tranverse ties spacing (*s*)= 125 mm
	
    * *f<sub>y</sub>*=462 MPa;*d<sub>b</sub>*=22.225 mm
	
    * *S<sub>n</sub>*= (*s*/*d<sub>b</sub>*)×(*f<sub>y</sub>*/100)<sup>0.5</sup>=12.05

12. Indicator variable for the possibility of rebar slip (*α<sub>sl</sub>*) =1
	
14. Nominal Shear Capacity (*V<sub>n</sub>*) = 1282 MPa (As per ACI 316 - 016) 

Additional Parameters for My
	
17. Yield Curvature (*ϕ<sub>y</sub>*) = 7e-6 (as per Pengiotakos and Fardis 2001)

18. Compression zone depth (*k<sub>y</sub>*) = 0.32 (as per Pengiotakos and Fardis 2001)

19. *δ'* = 0.13
    * Distance of the center of the rebar from the extreme fiber -mm(*d'*) = 65
    * *δ'* = d'/d = 0.13
	
20. *ρ<sub>comb</sub>*=0.0059 
    * *ρ<sub>comb</sub>*=(1-*k<sub>y</sub>*)*ρ<sub>t</sub>* + (*k<sub>y</sub>*-*δ'*)*ρ<sub>t</sub>* + (1-*δ'*)*ρ<sub>v</sub>*/6
    * *ρ<sub>v</sub>* = web reinforcement ratio =0 
    * *ρ<sub>comb</sub>* = 0.0059
	
### Implementation

**Press 'Calculate'**
![Screenshot (904)](https://user-images.githubusercontent.com/66442506/148815690-01d0791f-ee2a-4b7a-96aa-2602fb904fba.png)

# References
1. Rayjada, S. P., Ghosh, J., Raghunandan, M. (2023), “Machine Learning-based RC Beam-Column Model Parameter Estimation
and Uncertainty Quantification for Seismic Fragility Assessment”, Engineering Structures,278. https://10.1016/j.engstruct.2022.115111. 
2. Haselton CB, Liel AB, Taylor-lange SC, Deierlein GG. Calibration of model to simulate response of reinforced concrete beam-columns to collapse. ACI Struct J     2016;113:1141–52.https://doi.org/10.14359/51689245
3. Panagiotakos TB, Fardis MN. Deformations of reinforced concrete members at yielding and ultimate.
701 ACI Struct J 2001;98:135–48. https://doi.org/10.14359/10181.
