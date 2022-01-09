# Problem Statement 
The column cross-section details are given in the figure below. The dimension of the column is 22’’ × 22’’ (560 mm ×  560 mm) with a 40 mm clear cover provided in all the directions. The height of the column is 13 ft ( ≈ 4000 mm). The end conditions are assumed to be fixed-fixed. 


The column is designed to resist the factored axial load of 685 kN. Here, a column is designed for the uniaxial bending. The backbone curve obtained from this approach is often used for 2-D analysis using lumped plasticity model. Hence, the uniaxial bending assumption is valid in the majority of cases. 5 No. of #7 longitudinal rebars are used at the top and bottom to resist bending, as shown in the figures. 5 No. of ties of #4 rebars are used as transverse reinforcement. 
 
<p align="center">
<img src = https://user-images.githubusercontent.com/66442506/148672678-89a9d141-883a-49e3-b89a-eb3f151155c7.png width="460" height="260">
<\p> 

Based on the standard cylinder test, the compressive strength of unconfined concrete is 5 ksi (≈34.5 MPa). At the same time, the yield stress of longitudinal and transverse reinforcement is 67 ksi (≈462 MPa) and 60 ksi (≈414 MPa), respectively. 

  ## Inputs for Option 1 – Using Basic Parameters
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
  
## Inputs for Option 2 – Using Derived Parameters 

1. Shear span to effective depth ratio (*L<sub>s</sub>/H*) = 3.57
	
	*L<sub>s</sub>*=2000 mm (fixed-fixed);*H*=560 mm;*L<sub>s</sub>/H*=3.57
	
2. Axial load ratio (*v*) = 0.0633
	
   * Gross cross section area *A*=*B*×*H*=560<sup>2</sup>=313660 mm<sup>2</sup>

   * Axial load (*P*)=685 kN
	
   * Concrete compressive strength (*f<sub>c</sub>*)=34.5 Mpa
	
   * Axial load ratio (v)= *P*/(*f<sub>c</sub>*×*A<sub>g</sub>*) =685000/(34.5×313660)=0.0633

3. Concrete compressive strength -MPa (*f<sub>c</sub>*) = 34.5 
	
4. Longitudinal reinforcement yield strength -MPa (*f<sub>y</sub>*) = 492 
	
5. Longitudinal reinforcement ratio (*ρ*) = 0.014

    * Number of rebars in tension zone (*N<sub>t</sub>*)= 5
	
    * Number of rebars in compression zone (*N<sub>t</sub>*) = 5
     
    * Diameter of bar (*d<sub>b</sub>*)= 22.225 mm
	
    * Tensile reinforcemnt ratio(*ρ<sub>t</sub>*)=compression.reinforcement ratio (*ρ<sub>c</sub>*)
   
    * *ρ<sub>t</sub>*=*ρ<sub>c</sub>* = (π/4×*d<sub>b</sub>*<sup>2</sup>*N<sub>t</sub>*)/*A<sub>g</sub>* =0.007
	
    * *ρ* = *ρ<sub>t</sub>* + *ρ<sub>c</sub>* = 0.014 

6. Maximum diameter of longitudinal rebar - mm (*d<sub>b</sub>*) = 22.225 
	
7. Rebar buckling coefficient (*S<sub>n</sub>*)
	
    * Tranverse ties spacing (*s*)= 125 mm
	
    * *f<sub>y</sub>*=462 MPa;*d<sub>b</sub>*=22.225 mm
	
    * *S<sub>n</sub>*= (*s*/*d<sub>b</sub>*)×(*f<sub>y</sub>*/100)<sup>0.5</sup>=12.05
	
8. Transverse reinforcement area - sq. mm (*A<sub>sh</sub>*) = 
    * Diameter of tranverse bar (*d<sub>sh</sub>*)= 12.7 mm; 
	
    * Number of transverse ties (*N<sub>sh</sub>*)= 5
	
    * *A<sub>sh</sub>*=(π/4×*d<sub>sh</sub>*<sup>2</sup>*N<sub>sh</sub>*)=633.38 mm<sup>2</sup>
	
9. Transverse reinforcement ratio (*ρ<sub>sh</sub>*) = 0.009
    
    * *ρ<sub>sh</sub>*=*A<sub>sh</sub>*/*b<sub>s</sub>*=0.009
	
10. Effective transverse reinforcement ratio (*ρ<sub>sh,eff</sub>*)= 0.106
	
    * *ρ<sub>sh,eff</sub>*=*ρ<sub>sh</sub>* × *f<sub>y,sh</sub>*/*f<sub>c</sub>* =0.106
	
11. Transverse reinforcement yield stress - MPa (*f<sub>y,sh</sub>*) = 685

12. Indicator variable for the possibility of rebar slip (*α<sub>sl</sub>*) =1
	
13. Cross-sectional area (*A*) = 313660 mm<sup>2</sup>

14. Nominal Shear Capacity (*V<sub>n</sub>*) = 1282 MPa (As per ACI 316 - 016) 

Additional Parameters for My
	
15. 











