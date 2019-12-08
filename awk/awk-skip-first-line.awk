# ls -la | awk -f awk-skip-first-line.awk

# with condition inside default block
# { if(NR>2)print}

# with condition before block
NR>2{print}

