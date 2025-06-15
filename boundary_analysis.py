import pandas as pd
import math

# Update path if needed
df = pd.read_csv('data/iris.csv')

total = df.size
count = 0
for col in df.columns:
    values = df[col].dropna().astype(float)
    count += values.apply(lambda x: abs(x - round(x)) < 0.001).sum()

print(f"Total values: {total}")
print(f"Ambiguous samples near integers: {count}")
print(f"Ambiguity percentage: {100 * count / total:.2f}%")
