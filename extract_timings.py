#!/usr/bin/env python
import sys

exec("data = %s" % sys.argv[1])

msa = data['features']
msa += sum(data[x] for x in data if x.startswith('process_features_model_'))

predict = sum(data[x] for x in data if x.startswith('predict_and_compile_model_'))

relax = sum(data[x] for x in data if x.startswith('relax_model_'))

print('MSA: %s' % msa)
print('predict: %s' % predict)
print('relax: %s' % relax)
