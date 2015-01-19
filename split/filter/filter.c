#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void printHeader(FILE *fp)
{
  
  fprintf(fp, "#ORIGINAL_SOURCE MULTISPLIT\n"
"#CREATURE \n"
"#REGION \n"
"#FIELD/LAYER \n"
"#TYPE \n"
"#CONTRIBUTOR \n"
"#REFERENCE \n"
"#RAW \n"
"#EXTRAS \n"
"#SOMA_AREA\n"
"#SHINKAGE_CORRECTION 1.000000 1.000000 1.000000\n"
"#VERSION_NUMBER\n"
"#VERSION_DATE 2012-04-22\n"
"#SCALE 1.0 1.0 1.0\n"
"\n"
);

}

int main(int argc, char **argv)
{
  FILE *fp;
  FILE *output_fp=NULL;
  char buf[1024];
  int table[20000];
  int id,parent,root;
  double x,y,z,diam;
  int i,j, hit;
  int node;

  //char filename_template[] = "./swc/Cell_BN_1056_node%d_root%d.swc";
  char filename_template[] = "%sCell_BN_1056_node%d_part%d.swc";
  char filename[1024];
  char dirname[1024] = "./split_swc/";
  char cell_name[] = "Cell_BN_1056[0].dend[%d]";
  char scanf_template[] = "%s%s%s%s%s%s\n";
  char scanf_template1[] = "%d : SWC(";
  char scanf_template2[] = ") : ";
  char scanf_template3[] = " %lf %lf %lf %lf ";
  char scanf_format[1024];

  int comp_counter=0;
  int comp_counter_node[128];
  int part_node[128];
  for(i=0; i<128;i++){ comp_counter_node[i]=0; part_node[i]=0; }

  sprintf(scanf_format, scanf_template, scanf_template1, cell_name, scanf_template2, cell_name, scanf_template3, cell_name);

  printf("%s\n", cell_name);

  if(argc==1){
    printf("USEAGE : \n");
    return(-1);
  }else if(argc==3){
    strcpy(argv[2], dirname);
  }

  fp = fopen(argv[1], "r");

  /*
  printHeader();

  if(fgets(buf, 1024, fp)==NULL){ return(-1); }
  sscanf(buf, "SWC : Cell_BN_1056[0].dend[%d] %lf %lf %lf %lf -1\n", &id, &x, &y, &z, &diam);
  printf("%d %f %f %f %f %d\n", 1, x, y, z, diam, -1);
  table[1] = id;
  i = 2;
  */
  while(1){
    if(fgets(buf, 1024, fp)==NULL){ break; }
    //sscanf(buf, "%d : SWC(Cell_BN_1056[0].dend[%d]) : Cell_BN_1056[0].dend[%d] %lf %lf %lf %lf Cell_BN_1056[0].dend[%d]\n", &node, &root, &id, &x, &y, &z, &diam, &parent);
    sscanf(buf, scanf_format, &node, &root, &id, &x, &y, &z, &diam, &parent);

    // initialize swc
    if(parent==-1){
      sprintf(filename, filename_template, dirname, node, part_node[node]);
      if(output_fp!=NULL){ fclose(output_fp); }
      output_fp = fopen(filename, "w");
      printHeader(output_fp);
      // reset table
      for(i=0; i<20000; i++){
	table[i] = -1;
      }
      fprintf(output_fp, "%d %d %f %f %f %f %d\n", 1, node, x, y, z, diam, -1);
      table[1] = root;
      printf("node = %d, root = %d\n", node, root);
      part_node[node]++;
      i = 1;

    }else{
      j=1; hit=0;
      while(table[j]!=-1){
	if(table[j] == parent){
	  hit = 1;
	  break;
	}
	j++;
      }
      if(hit==0){ printf("error i=%d j=%d\n", i, j); break; }
      fprintf(output_fp, "%d %d %f %f %f %f %d\n", i, node, x, y, z, diam, j);
      table[i] = id;
      comp_counter++;
      comp_counter_node[node]++;
    }
    
    i++;
  }
  fclose(output_fp);
  fclose(fp);
  printf("Total Compartments : %d\n", comp_counter);
  for(i=0; i<128; i++){ if(comp_counter_node[i]!=0){ printf(" NODE%d : %d comp\n", i, comp_counter_node[i]); } }
  return(0);
}
