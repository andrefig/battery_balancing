# battery_balancing
  Matlab / Simulink code used for simulating two algorithms for LIFEPO battery balancing (Mean SoC and Minimum SoC). This simulations were later used for my Msc. I must organize this later...
  The battery consists of four battery cells:
    - Each battery cell model is modelled with a (nonlinear) third order equivalent circuit (One state is the SoC, the other ones are fast dynamics).
    - The ballancing system consists of an UKF/EKF state estimator for each battery and a simple passive balancing controller (i.e.: a resistor is conected between the cell terminals to drain current from the cells with greater SoC).
  This simulation was used in http://pee.ufrj.br/teses/textocompleto/2015122201.pdf and can be better understood in this context.
