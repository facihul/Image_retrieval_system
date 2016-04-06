function histout = LBP_histogram(im)

  histout = extractLBPFeatures(im,'Upright',false);