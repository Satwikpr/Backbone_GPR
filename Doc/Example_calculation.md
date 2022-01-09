# Problem Statement 
The column cross-section details are given in the figure below. The dimension of the column is 22’’ × 22’’ (560 mm ×  560 mm) with a 40 mm clear cover provided in all the directions. The height of the column is 13 ft ( ≈ 4000 mm). The end conditions are assumed to be fixed-fixed. 


The column is designed to resist the factored axial load of 685 kN. Here, a column is designed for the uniaxial bending. The backbone curve obtained from this approach is often used for 2-D analysis using lumped plasticity model. Hence, the uniaxial bending assumption is valid in the majority of cases. 5 No. of #7 longitudinal rebars are used at the top and bottom to resist bending, as shown in the figures. 5 No. of ties of #4 rebars are used as transverse reinforcement. 
 
<p align="center">
<img src = https://user-images.githubusercontent.com/66442506/148672678-89a9d141-883a-49e3-b89a-eb3f151155c7.png width="460" height="260">
<\p> 

Based on the standard cylinder test, the compressive strength of unconfined concrete is 5 ksi (≈34.5 MPa). At the same time, the yield stress of longitudinal and transverse reinforcement is 67 ksi (≈462 MPa) and 60 ksi (≈414 MPa), respectively. 

  ## Inputs for Option 1 – Using Basic Parameters
  Cross section depth - mm (*H*) = 560
  
  Cross section width - mm (*B*) = 560
  
Effective depth - mm (*d*) = 495 
  
*d* = 560 – 65 = 495 mm
  
Distance of the center of the rebar from the extreme fiber -mm(*d'*) = 65 
  
Shear Span – mm (*L<sub>s</sub>*) = 2000 
 
For fixed-fixed case, *L<sub>s</sub>*= (Length of column (*L*))/2=4000/2=2000 mm
  
Concrete compressive strength -MPa (*f<sub>c</sub>*) = 34.5 
  
Longitudinal reinforcement yield strength -MPa (*f<sub>y</sub>*) = 492 
  
Axial load- kN (*P*) = 685 
  
Number of rebars in tension zone (*N<sub>t</sub>*) = 5

Number of rebars in compression zone (*N<sub>c</sub>*) = 5
	
Maximum diameter of longitudinal rebar - mm (*d<sub>b</sub>*) = 22.225 
	
Maximum diameter of transverse ties - mm (*d<sub>t</sub>*) = 12.7 
	
Number of transverse ties (*N<sub>t</sub>*) = 5
	
Transverse reinforcement yield stress - MPa (*f<sub>y,sh</sub>*) = 685
	
Transverse reinforcement spacing - mm (s) = 125
	
Indicator variable for the possibility of rebar slip (*α<sub>sl</sub>*) =1
  
## Inputs for Option 2 – Using Derived Parameters 

Shear span to effective depth ratio (Ls/H) = 3.57
  
  L_s=2000 mm (fixed-fixed);H=560 mm;L_s/H=3.57
  
 Axial load ratio  (v) 
Gross cross section area A=B×H=560^2=313660 mm^2
	Axial load (P)=685 kN
	Concrete compressive strength (f_c )=34.5 Mpa
	Axial load ratio (v)=P/(f_c A_g )=685000/(34.5× 313660 )=0.0633
	Concrete compressive strength -MPa (fc) = 34.5 
	Longitudinal reinforcement yield strength -MPa (fy) = 492 
	Longitudinal reinforcement ratio (ρ) = 0.014
	Number of rebars in tension zone (N_t )= 5
	Number of rebars in compression zone (N_c )
	Diameter of bar (d_b )= 22.225 mm
	Tensile reinforcemnt ratio(ρ_t )=compression.reinforcement ratio (ρ_c )
	ρ_t=ρ_c=(N_t (π/4 d_b^2 ))/A_g =0.007;
	ρ= ρ_t+ρ_c=0.014 
	Shear Span (Ls) = 2000 
	For fixed-fixed condition,L_s=(Length of the member (L))/2=4000/2=2000 mm
	   Maximum diameter of longitudinal rebar - mm (db) = 22.225 
	   Rebar buckling coefficient (Sn)
	Tranverse ties spacing (s)= 125 mm;f_y=462 MPa;d_b=22.225 mm
	s_n=s/d_b  (f_y/100)^0.5=12.05
	   Transverse reinforcement area - sq. mm (Ash) = 
	Diameter of tranverse bar (d_sh )= 12.7 mm; 
	 Number of transverse ties (N_sh )= 5
	A_sh=N_sh  π/4 d_sh^2=633.38 mm^2  
	   Transverse reinforcement ratio (ρsh) 
	ρ_sh=A_sh/bs=0.009
	   Effective transverse reinforcement ratio (ρsh,eff)
	ρ_(sh,eff)=ρ_sh  f_(y,sh)/f_c =0.106
	   Transverse reinforcement yield stress - MPa (fy,sh) = 685
	   Indicator variable for the possibility of rebar slip (αsl) =1\
	   Cross-sectional area (A) = 313660 mm^2











