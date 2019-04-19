all <- read.table("input_glm_split_with_iteration_all.txt", header=F)
all

ok <- read.table("input_glm_split_with_iteration_results_00_01_03_04_05_06_07_08_09_10_11_12_13_14_15_16_17_18_ok.txt", header=F)
ok


for_rerun <- all[!all$V2 %in% ok$V2, , drop = FALSE]

write.table(for_rerun, "for_rerun.txt")
