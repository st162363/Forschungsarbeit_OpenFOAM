# trace generated using paraview version 5.10.0-RC1
#import paraview
#paraview.compatibility.major = 5
#paraview.compatibility.minor = 10

#### import the simple module from the paraview
from paraview.simple import *
#### disable automatic camera reset on 'Show'
paraview.simple._DisableFirstRenderCameraReset()

# find source
plotOverLine2 = FindSource('PlotOverLine2')

# set active source
SetActiveSource(plotOverLine2)

# find view
lineChartView1 = FindViewOrCreate('LineChartView1', viewtype='XYChartView')

# set active view
SetActiveView(lineChartView1)

# get display properties
plotOverLine2Display = GetDisplayProperties(plotOverLine2, view=lineChartView1)

# find source
plotOverLine1 = FindSource('PlotOverLine1')

# set active source
SetActiveSource(plotOverLine1)

# get display properties
plotOverLine1Display = GetDisplayProperties(plotOverLine1, view=lineChartView1)

# set active source
SetActiveSource(plotOverLine2)

# save data
SaveData('/home/anton/OpenFOAM/anton-11/run/Screenshots_temp/000_Export_Data.csv', proxy=plotOverLine2, PointDataArrays=['U', 'arc_length', 'epsilon', 'k', 'nut', 'p', 'vtkValidPointMask', 'wallShearStress', 'yPlus'])

#================================================================
# addendum: following script captures some of the application
# state to faithfully reproduce the visualization during playback
#================================================================

# get layout
layout1 = GetLayout()

#--------------------------------
# saving layout sizes for layouts

# layout/tab size in pixels
layout1.SetSize(1487, 768)

#--------------------------------------------
# uncomment the following to render all views
# RenderAllViews()
# alternatively, if you want to write images, you can use SaveScreenshot(...).