NEURON mod files from the paper:
Maciej T. Lazarewicz, Michele Migliore, Giorgio A. Ascoli (2002)
A new bursting model of CA3 pyramidal cell physiology suggests multiple 
locations for spike initiation, Biosystems, 67:129-137.

The model shows how using a CA1-like distribution of active
dendritic conductances in a CA3 morphology results in 
dendritic initiation of spikes during a burst. 
The effect is demonstrated here in a demo
simulation reproducing the results in Fig.2 of the paper.
The ca3_paper.hoc simulation will show the membrane potential at the soma,
the time course of membrane potential with distance from soma 
for three different paths spanning the entire neuron lenght,
and a movie of the neuron depolarization (a NEURON Shape Plot)
during a burst elicited by a short (1nA, 5ms) somatic current pulse.

The simulation is best appreciated using a black background for the graphs.
To invert the background/foreground color edit
the lib/nrn.def (windows) or share/nrn/lib/nrn.defaults (unix) file 
in the NEURON home directory, and change the two lines
 
*Scene_background: #ffffff   
*Scene_foreground: #000000   
 
to 

*Scene_background: #000000   
*Scene_foreground: #ffffff   

This change will affect all future graphs, so
do not forget to reset the values to their original values
if you do not like graphs with a black background and white lines.

Under unix systems:
to compile the mod files use the command 
nrnivmodl 
and run the simulation with the command 
nrngui ca3_paper.hoc

Under Windows systems:
to compile the mod files use the "mknrndll" command.
A double click on the simulation file
ca3_paper.hoc 
will run the simulation.

Questions on how to use this model with NEURON should be directed to 
Maciej Lazarewicz (mailto:mlazarew@seas.upenn.edu) 

Questions on how to use the mod files should be directed to
Michele Migliore (michele.migliore@pa.ibf.cnr.it).

Thanks to Leif Finkel and Elliot Menschik, UPENN, 
for valuable discussions on the model.

Bugs and fixes:
03 July 2003  -  M. Migliore
Fixed a bug in the vhalfl and ehd variable declaration in KhdM01.mod

19 Sept 2007 - T. Morse
Set 0 diam points in soma in ca3a.geo to 1e-9 so modelview works.
