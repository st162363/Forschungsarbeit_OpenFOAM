# trace generated using paraview version 5.10.0-RC1
#import paraview
#paraview.compatibility.major = 5
#paraview.compatibility.minor = 10

#### import the simple module from the paraview
from paraview.simple import *
#### disable automatic camera reset on 'Show'
paraview.simple._DisableFirstRenderCameraReset()

# get active source.
a016_couette_Netzverfeinerung_4OpenFOAM = GetActiveSource()

# get active view
renderView1 = GetActiveViewOrCreate('RenderView')

# get display properties
a016_couette_Netzverfeinerung_4OpenFOAMDisplay = GetDisplayProperties(a016_couette_Netzverfeinerung_4OpenFOAM, view=renderView1)

# change representation type
a016_couette_Netzverfeinerung_4OpenFOAMDisplay.SetRepresentationType('Surface With Edges')

# change representation type
a016_couette_Netzverfeinerung_4OpenFOAMDisplay.SetRepresentationType('Surface')

# get color transfer function/color map for 'vtkBlockColors'
vtkBlockColorsLUT = GetColorTransferFunction('vtkBlockColors')
vtkBlockColorsLUT.InterpretValuesAsCategories = 1
vtkBlockColorsLUT.AnnotationsInitialized = 1
vtkBlockColorsLUT.RGBPoints = [-0.01685274951159954, 0.0, 0.0, 1.0, 0.0356965996325016, 1.0, 0.0, 0.0]
vtkBlockColorsLUT.ColorSpace = 'HSV'
vtkBlockColorsLUT.NanColor = [0.498039215686, 0.498039215686, 0.498039215686]
vtkBlockColorsLUT.Annotations = ['0', '0', '1', '1', '2', '2', '3', '3', '4', '4', '5', '5', '6', '6', '7', '7', '8', '8', '9', '9', '10', '10', '11', '11']
vtkBlockColorsLUT.ActiveAnnotatedValues = ['0', '1', '2', '3']
vtkBlockColorsLUT.IndexedColors = [1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 0.0, 1.0, 0.0, 1.0, 0.0, 1.0, 1.0, 0.63, 0.63, 1.0, 0.67, 0.5, 0.33, 1.0, 0.5, 0.75, 0.53, 0.35, 0.7, 1.0, 0.75, 0.5]

# get animation scene
animationScene1 = GetAnimationScene()

animationScene1.GoToLast()

# set scalar coloring
ColorBy(a016_couette_Netzverfeinerung_4OpenFOAMDisplay, ('POINTS', 'U', 'Magnitude'))

# Hide the scalar bar for this color map if no visible data is colored by it.
HideScalarBarIfNotNeeded(vtkBlockColorsLUT, renderView1)

# rescale color and/or opacity maps used to include current data range
a016_couette_Netzverfeinerung_4OpenFOAMDisplay.RescaleTransferFunctionToDataRange(True, False)

# show color bar/color legend
a016_couette_Netzverfeinerung_4OpenFOAMDisplay.SetScalarBarVisibility(renderView1, True)

# get color transfer function/color map for 'U'
uLUT = GetColorTransferFunction('U')
uLUT.RGBPoints = [0.0, 0.0, 0.0, 1.0, 0.5400000214576721, 1.0, 0.0, 0.0]
uLUT.ColorSpace = 'HSV'
uLUT.NanColor = [0.498039215686, 0.498039215686, 0.498039215686]
uLUT.ScalarRangeInitialized = 1.0

# get opacity transfer function/opacity map for 'U'
uPWF = GetOpacityTransferFunction('U')
uPWF.Points = [0.0, 0.0, 0.5, 0.0, 0.5400000214576721, 1.0, 0.5, 0.0]
uPWF.ScalarRangeInitialized = 1

# rescale color and/or opacity maps used to exactly fit the current data range
a016_couette_Netzverfeinerung_4OpenFOAMDisplay.RescaleTransferFunctionToDataRange(False, True)

# create a new 'Plot Over Line'
plotOverLine1 = PlotOverLine(registrationName='PlotOverLine1', Input=a016_couette_Netzverfeinerung_4OpenFOAM)
plotOverLine1.Point2 = [0.5, 0.10000000149011612, 0.009999999776482582]

# Properties modified on plotOverLine1
plotOverLine1.Point1 = [0.0, 0.05, 0.005]
plotOverLine1.Point2 = [0.5, 0.05, 0.005]

# show data in view
plotOverLine1Display = Show(plotOverLine1, renderView1, 'GeometryRepresentation')

# trace defaults for the display properties.
plotOverLine1Display.Representation = 'Surface'
plotOverLine1Display.ColorArrayName = ['POINTS', 'U']
plotOverLine1Display.LookupTable = uLUT
plotOverLine1Display.SelectTCoordArray = 'None'
plotOverLine1Display.SelectNormalArray = 'None'
plotOverLine1Display.SelectTangentArray = 'None'
plotOverLine1Display.OSPRayScaleArray = 'U'
plotOverLine1Display.OSPRayScaleFunction = 'PiecewiseFunction'
plotOverLine1Display.SelectOrientationVectors = 'None'
plotOverLine1Display.ScaleFactor = 0.05
plotOverLine1Display.SelectScaleArray = 'None'
plotOverLine1Display.GlyphType = 'Arrow'
plotOverLine1Display.GlyphTableIndexArray = 'None'
plotOverLine1Display.GaussianRadius = 0.0025
plotOverLine1Display.SetScaleArray = ['POINTS', 'U']
plotOverLine1Display.ScaleTransferFunction = 'PiecewiseFunction'
plotOverLine1Display.OpacityArray = ['POINTS', 'U']
plotOverLine1Display.OpacityTransferFunction = 'PiecewiseFunction'
plotOverLine1Display.DataAxesGrid = 'GridAxesRepresentation'
plotOverLine1Display.PolarAxes = 'PolarAxesRepresentation'

# init the 'PiecewiseFunction' selected for 'OSPRayScaleFunction'
plotOverLine1Display.OSPRayScaleFunction.Points = [-0.01685274951159954, 0.0, 0.5, 0.0, 0.0356965996325016, 1.0, 0.5, 0.0]

# init the 'PiecewiseFunction' selected for 'ScaleTransferFunction'
plotOverLine1Display.ScaleTransferFunction.Points = [-0.019557632505893707, 0.0, 0.5, 0.0, -0.008829304948449135, 1.0, 0.5, 0.0]

# init the 'PiecewiseFunction' selected for 'OpacityTransferFunction'
plotOverLine1Display.OpacityTransferFunction.Points = [-0.019557632505893707, 0.0, 0.5, 0.0, -0.008829304948449135, 1.0, 0.5, 0.0]

# Create a new 'Line Chart View'
lineChartView1 = CreateView('XYChartView')

# show data in view
plotOverLine1Display_1 = Show(plotOverLine1, lineChartView1, 'XYChartRepresentation')

# trace defaults for the display properties.
plotOverLine1Display_1.UseIndexForXAxis = 0
plotOverLine1Display_1.XArrayName = 'arc_length'
plotOverLine1Display_1.SeriesVisibility = ['epsilon', 'k', 'nut', 'p', 'U_Magnitude', 'wallShearStress_Magnitude', 'yPlus']
plotOverLine1Display_1.SeriesLabel = ['arc_length', 'arc_length', 'epsilon', 'epsilon', 'k', 'k', 'nut', 'nut', 'p', 'p', 'U_X', 'U_X', 'U_Y', 'U_Y', 'U_Z', 'U_Z', 'U_Magnitude', 'U_Magnitude', 'vtkValidPointMask', 'vtkValidPointMask', 'wallShearStress_X', 'wallShearStress_X', 'wallShearStress_Y', 'wallShearStress_Y', 'wallShearStress_Z', 'wallShearStress_Z', 'wallShearStress_Magnitude', 'wallShearStress_Magnitude', 'yPlus', 'yPlus', 'Points_X', 'Points_X', 'Points_Y', 'Points_Y', 'Points_Z', 'Points_Z', 'Points_Magnitude', 'Points_Magnitude']
plotOverLine1Display_1.SeriesColor = ['arc_length', '0', '0', '0', 'epsilon', '0.8899977111467154', '0.10000762951094835', '0.1100022888532845', 'k', '0.220004577706569', '0.4899977111467155', '0.7199969481956207', 'nut', '0.30000762951094834', '0.6899977111467155', '0.2899977111467155', 'p', '0.6', '0.3100022888532845', '0.6399938963912413', 'U_X', '1', '0.5000076295109483', '0', 'U_Y', '0.6500038147554742', '0.3400015259021897', '0.16000610360875867', 'U_Z', '0', '0', '0', 'U_Magnitude', '0.8899977111467154', '0.10000762951094835', '0.1100022888532845', 'vtkValidPointMask', '0.220004577706569', '0.4899977111467155', '0.7199969481956207', 'wallShearStress_X', '0.30000762951094834', '0.6899977111467155', '0.2899977111467155', 'wallShearStress_Y', '0.6', '0.3100022888532845', '0.6399938963912413', 'wallShearStress_Z', '1', '0.5000076295109483', '0', 'wallShearStress_Magnitude', '0.6500038147554742', '0.3400015259021897', '0.16000610360875867', 'yPlus', '0', '0', '0', 'Points_X', '0.8899977111467154', '0.10000762951094835', '0.1100022888532845', 'Points_Y', '0.220004577706569', '0.4899977111467155', '0.7199969481956207', 'Points_Z', '0.30000762951094834', '0.6899977111467155', '0.2899977111467155', 'Points_Magnitude', '0.6', '0.3100022888532845', '0.6399938963912413']
plotOverLine1Display_1.SeriesPlotCorner = ['arc_length', '0', 'epsilon', '0', 'k', '0', 'nut', '0', 'p', '0', 'U_X', '0', 'U_Y', '0', 'U_Z', '0', 'U_Magnitude', '0', 'vtkValidPointMask', '0', 'wallShearStress_X', '0', 'wallShearStress_Y', '0', 'wallShearStress_Z', '0', 'wallShearStress_Magnitude', '0', 'yPlus', '0', 'Points_X', '0', 'Points_Y', '0', 'Points_Z', '0', 'Points_Magnitude', '0']
plotOverLine1Display_1.SeriesLabelPrefix = ''
plotOverLine1Display_1.SeriesLineStyle = ['arc_length', '1', 'epsilon', '1', 'k', '1', 'nut', '1', 'p', '1', 'U_X', '1', 'U_Y', '1', 'U_Z', '1', 'U_Magnitude', '1', 'vtkValidPointMask', '1', 'wallShearStress_X', '1', 'wallShearStress_Y', '1', 'wallShearStress_Z', '1', 'wallShearStress_Magnitude', '1', 'yPlus', '1', 'Points_X', '1', 'Points_Y', '1', 'Points_Z', '1', 'Points_Magnitude', '1']
plotOverLine1Display_1.SeriesLineThickness = ['arc_length', '2', 'epsilon', '2', 'k', '2', 'nut', '2', 'p', '2', 'U_X', '2', 'U_Y', '2', 'U_Z', '2', 'U_Magnitude', '2', 'vtkValidPointMask', '2', 'wallShearStress_X', '2', 'wallShearStress_Y', '2', 'wallShearStress_Z', '2', 'wallShearStress_Magnitude', '2', 'yPlus', '2', 'Points_X', '2', 'Points_Y', '2', 'Points_Z', '2', 'Points_Magnitude', '2']
plotOverLine1Display_1.SeriesMarkerStyle = ['arc_length', '0', 'epsilon', '0', 'k', '0', 'nut', '0', 'p', '0', 'U_X', '0', 'U_Y', '0', 'U_Z', '0', 'U_Magnitude', '0', 'vtkValidPointMask', '0', 'wallShearStress_X', '0', 'wallShearStress_Y', '0', 'wallShearStress_Z', '0', 'wallShearStress_Magnitude', '0', 'yPlus', '0', 'Points_X', '0', 'Points_Y', '0', 'Points_Z', '0', 'Points_Magnitude', '0']
plotOverLine1Display_1.SeriesMarkerSize = ['arc_length', '4', 'epsilon', '4', 'k', '4', 'nut', '4', 'p', '4', 'U_X', '4', 'U_Y', '4', 'U_Z', '4', 'U_Magnitude', '4', 'vtkValidPointMask', '4', 'wallShearStress_X', '4', 'wallShearStress_Y', '4', 'wallShearStress_Z', '4', 'wallShearStress_Magnitude', '4', 'yPlus', '4', 'Points_X', '4', 'Points_Y', '4', 'Points_Z', '4', 'Points_Magnitude', '4']

# get layout
layout1 = GetLayoutByName("Layout #1")

# add view to a layout so it's visible in UI
AssignViewToLayout(view=lineChartView1, layout=layout1, hint=0)

# Properties modified on plotOverLine1Display_1
plotOverLine1Display_1.SeriesPlotCorner = ['Points_Magnitude', '0', 'Points_X', '0', 'Points_Y', '0', 'Points_Z', '0', 'U_Magnitude', '0', 'U_X', '0', 'U_Y', '0', 'U_Z', '0', 'arc_length', '0', 'epsilon', '0', 'k', '0', 'nut', '0', 'p', '0', 'vtkValidPointMask', '0', 'wallShearStress_Magnitude', '0', 'wallShearStress_X', '0', 'wallShearStress_Y', '0', 'wallShearStress_Z', '0', 'yPlus', '0']
plotOverLine1Display_1.SeriesLineStyle = ['Points_Magnitude', '1', 'Points_X', '1', 'Points_Y', '1', 'Points_Z', '1', 'U_Magnitude', '1', 'U_X', '1', 'U_Y', '1', 'U_Z', '1', 'arc_length', '1', 'epsilon', '1', 'k', '1', 'nut', '1', 'p', '1', 'vtkValidPointMask', '1', 'wallShearStress_Magnitude', '1', 'wallShearStress_X', '1', 'wallShearStress_Y', '1', 'wallShearStress_Z', '1', 'yPlus', '1']
plotOverLine1Display_1.SeriesLineThickness = ['Points_Magnitude', '2', 'Points_X', '2', 'Points_Y', '2', 'Points_Z', '2', 'U_Magnitude', '2', 'U_X', '2', 'U_Y', '2', 'U_Z', '2', 'arc_length', '2', 'epsilon', '2', 'k', '2', 'nut', '2', 'p', '2', 'vtkValidPointMask', '2', 'wallShearStress_Magnitude', '2', 'wallShearStress_X', '2', 'wallShearStress_Y', '2', 'wallShearStress_Z', '2', 'yPlus', '2']
plotOverLine1Display_1.SeriesMarkerStyle = ['Points_Magnitude', '0', 'Points_X', '0', 'Points_Y', '0', 'Points_Z', '0', 'U_Magnitude', '0', 'U_X', '0', 'U_Y', '0', 'U_Z', '0', 'arc_length', '0', 'epsilon', '0', 'k', '0', 'nut', '0', 'p', '0', 'vtkValidPointMask', '0', 'wallShearStress_Magnitude', '0', 'wallShearStress_X', '0', 'wallShearStress_Y', '0', 'wallShearStress_Z', '0', 'yPlus', '0']
plotOverLine1Display_1.SeriesMarkerSize = ['Points_Magnitude', '4', 'Points_X', '4', 'Points_Y', '4', 'Points_Z', '4', 'U_Magnitude', '4', 'U_X', '4', 'U_Y', '4', 'U_Z', '4', 'arc_length', '4', 'epsilon', '4', 'k', '4', 'nut', '4', 'p', '4', 'vtkValidPointMask', '4', 'wallShearStress_Magnitude', '4', 'wallShearStress_X', '4', 'wallShearStress_Y', '4', 'wallShearStress_Z', '4', 'yPlus', '4']

# set active view
SetActiveView(renderView1)

# hide data in view
Hide(plotOverLine1, renderView1)

# set active source
SetActiveSource(a016_couette_Netzverfeinerung_4OpenFOAM)

# toggle 3D widget visibility (only when running from the GUI)
Hide3DWidgets(proxy=plotOverLine1)

# layout/tab size in pixels
layout1.SetSize(1487, 770)

# current camera placement for renderView1
renderView1.CameraPosition = [0.25, 0.05000000074505806, 0.9902443432590722]
renderView1.CameraFocalPoint = [0.25, 0.05000000074505806, 0.004999999888241291]
renderView1.CameraParallelScale = 0.2550000001438985

# save screenshot
SaveScreenshot('/home/anton/OpenFOAM/anton-11/run/Screenshots_temp/Geschwindigkeitsprofil.png', renderView1, ImageResolution=[743, 770],
    OverrideColorPalette='WhiteBackground')

# set scalar coloring
ColorBy(a016_couette_Netzverfeinerung_4OpenFOAMDisplay, ('POINTS', 'p'))

# Hide the scalar bar for this color map if no visible data is colored by it.
HideScalarBarIfNotNeeded(uLUT, renderView1)

# rescale color and/or opacity maps used to include current data range
a016_couette_Netzverfeinerung_4OpenFOAMDisplay.RescaleTransferFunctionToDataRange(True, False)

# show color bar/color legend
a016_couette_Netzverfeinerung_4OpenFOAMDisplay.SetScalarBarVisibility(renderView1, True)

# get color transfer function/color map for 'p'
pLUT = GetColorTransferFunction('p')
pLUT.RGBPoints = [-0.71213299036026, 0.0, 0.0, 1.0, -3.0759699232163484e-09, 1.0, 0.0, 0.0]
pLUT.ColorSpace = 'HSV'
pLUT.NanColor = [0.498039215686, 0.498039215686, 0.498039215686]
pLUT.ScalarRangeInitialized = 1.0

# get opacity transfer function/opacity map for 'p'
pPWF = GetOpacityTransferFunction('p')
pPWF.Points = [-0.71213299036026, 0.0, 0.5, 0.0, -3.0759699232163484e-09, 1.0, 0.5, 0.0]
pPWF.ScalarRangeInitialized = 1

animationScene1.GoToLast()

# rescale color and/or opacity maps used to exactly fit the current data range
a016_couette_Netzverfeinerung_4OpenFOAMDisplay.RescaleTransferFunctionToDataRange(False, True)

# layout/tab size in pixels
layout1.SetSize(1487, 770)

# current camera placement for renderView1
renderView1.CameraPosition = [0.25, 0.05000000074505806, 0.9902443432590722]
renderView1.CameraFocalPoint = [0.25, 0.05000000074505806, 0.004999999888241291]
renderView1.CameraParallelScale = 0.2550000001438985

# save screenshot
SaveScreenshot('/home/anton/OpenFOAM/anton-11/run/Screenshots_temp/Druckverteilung.png', renderView1, ImageResolution=[743, 770],
    OverrideColorPalette='WhiteBackground')

# set active view
SetActiveView(lineChartView1)

# set active source
SetActiveSource(plotOverLine1)

# Properties modified on plotOverLine1Display_1
plotOverLine1Display_1.SeriesVisibility = ['arc_length', 'epsilon', 'k', 'nut', 'p', 'Points_Magnitude', 'Points_X', 'Points_Y', 'Points_Z', 'U_Magnitude', 'U_X', 'U_Y', 'U_Z', 'vtkValidPointMask', 'wallShearStress_Magnitude', 'wallShearStress_X', 'wallShearStress_Y', 'wallShearStress_Z', 'yPlus']

# Properties modified on plotOverLine1Display_1
plotOverLine1Display_1.SeriesVisibility = []

# Properties modified on plotOverLine1Display_1
plotOverLine1Display_1.SeriesVisibility = ['p']

# layout/tab size in pixels
layout1.SetSize(1487, 770)

# save screenshot
SaveScreenshot('/home/anton/OpenFOAM/anton-11/run/Screenshots_temp/Druckverteilung_plot.png', lineChartView1, ImageResolution=[743, 770],
    OverrideColorPalette='WhiteBackground')

# set active source
SetActiveSource(a016_couette_Netzverfeinerung_4OpenFOAM)

# create a new 'Plot Over Line'
plotOverLine2 = PlotOverLine(registrationName='PlotOverLine2', Input=a016_couette_Netzverfeinerung_4OpenFOAM)
plotOverLine2.Point2 = [0.5, 0.10000000149011612, 0.009999999776482582]

# Properties modified on plotOverLine2
plotOverLine2.Point1 = [0.25, 0.0, 0.005]
plotOverLine2.Point2 = [0.25, 0.1, 0.005]

# show data in view
plotOverLine2Display = Show(plotOverLine2, lineChartView1, 'XYChartRepresentation')

# trace defaults for the display properties.
plotOverLine2Display.UseIndexForXAxis = 0
plotOverLine2Display.XArrayName = 'arc_length'
plotOverLine2Display.SeriesVisibility = ['epsilon', 'k', 'nut', 'p', 'U_Magnitude', 'wallShearStress_Magnitude', 'yPlus']
plotOverLine2Display.SeriesLabel = ['arc_length', 'arc_length', 'epsilon', 'epsilon', 'k', 'k', 'nut', 'nut', 'p', 'p', 'U_X', 'U_X', 'U_Y', 'U_Y', 'U_Z', 'U_Z', 'U_Magnitude', 'U_Magnitude', 'vtkValidPointMask', 'vtkValidPointMask', 'wallShearStress_X', 'wallShearStress_X', 'wallShearStress_Y', 'wallShearStress_Y', 'wallShearStress_Z', 'wallShearStress_Z', 'wallShearStress_Magnitude', 'wallShearStress_Magnitude', 'yPlus', 'yPlus', 'Points_X', 'Points_X', 'Points_Y', 'Points_Y', 'Points_Z', 'Points_Z', 'Points_Magnitude', 'Points_Magnitude']
plotOverLine2Display.SeriesColor = ['arc_length', '0', '0', '0', 'epsilon', '0.8899977111467154', '0.10000762951094835', '0.1100022888532845', 'k', '0.220004577706569', '0.4899977111467155', '0.7199969481956207', 'nut', '0.30000762951094834', '0.6899977111467155', '0.2899977111467155', 'p', '0.6', '0.3100022888532845', '0.6399938963912413', 'U_X', '1', '0.5000076295109483', '0', 'U_Y', '0.6500038147554742', '0.3400015259021897', '0.16000610360875867', 'U_Z', '0', '0', '0', 'U_Magnitude', '0.8899977111467154', '0.10000762951094835', '0.1100022888532845', 'vtkValidPointMask', '0.220004577706569', '0.4899977111467155', '0.7199969481956207', 'wallShearStress_X', '0.30000762951094834', '0.6899977111467155', '0.2899977111467155', 'wallShearStress_Y', '0.6', '0.3100022888532845', '0.6399938963912413', 'wallShearStress_Z', '1', '0.5000076295109483', '0', 'wallShearStress_Magnitude', '0.6500038147554742', '0.3400015259021897', '0.16000610360875867', 'yPlus', '0', '0', '0', 'Points_X', '0.8899977111467154', '0.10000762951094835', '0.1100022888532845', 'Points_Y', '0.220004577706569', '0.4899977111467155', '0.7199969481956207', 'Points_Z', '0.30000762951094834', '0.6899977111467155', '0.2899977111467155', 'Points_Magnitude', '0.6', '0.3100022888532845', '0.6399938963912413']
plotOverLine2Display.SeriesPlotCorner = ['arc_length', '0', 'epsilon', '0', 'k', '0', 'nut', '0', 'p', '0', 'U_X', '0', 'U_Y', '0', 'U_Z', '0', 'U_Magnitude', '0', 'vtkValidPointMask', '0', 'wallShearStress_X', '0', 'wallShearStress_Y', '0', 'wallShearStress_Z', '0', 'wallShearStress_Magnitude', '0', 'yPlus', '0', 'Points_X', '0', 'Points_Y', '0', 'Points_Z', '0', 'Points_Magnitude', '0']
plotOverLine2Display.SeriesLabelPrefix = ''
plotOverLine2Display.SeriesLineStyle = ['arc_length', '1', 'epsilon', '1', 'k', '1', 'nut', '1', 'p', '1', 'U_X', '1', 'U_Y', '1', 'U_Z', '1', 'U_Magnitude', '1', 'vtkValidPointMask', '1', 'wallShearStress_X', '1', 'wallShearStress_Y', '1', 'wallShearStress_Z', '1', 'wallShearStress_Magnitude', '1', 'yPlus', '1', 'Points_X', '1', 'Points_Y', '1', 'Points_Z', '1', 'Points_Magnitude', '1']
plotOverLine2Display.SeriesLineThickness = ['arc_length', '2', 'epsilon', '2', 'k', '2', 'nut', '2', 'p', '2', 'U_X', '2', 'U_Y', '2', 'U_Z', '2', 'U_Magnitude', '2', 'vtkValidPointMask', '2', 'wallShearStress_X', '2', 'wallShearStress_Y', '2', 'wallShearStress_Z', '2', 'wallShearStress_Magnitude', '2', 'yPlus', '2', 'Points_X', '2', 'Points_Y', '2', 'Points_Z', '2', 'Points_Magnitude', '2']
plotOverLine2Display.SeriesMarkerStyle = ['arc_length', '0', 'epsilon', '0', 'k', '0', 'nut', '0', 'p', '0', 'U_X', '0', 'U_Y', '0', 'U_Z', '0', 'U_Magnitude', '0', 'vtkValidPointMask', '0', 'wallShearStress_X', '0', 'wallShearStress_Y', '0', 'wallShearStress_Z', '0', 'wallShearStress_Magnitude', '0', 'yPlus', '0', 'Points_X', '0', 'Points_Y', '0', 'Points_Z', '0', 'Points_Magnitude', '0']
plotOverLine2Display.SeriesMarkerSize = ['arc_length', '4', 'epsilon', '4', 'k', '4', 'nut', '4', 'p', '4', 'U_X', '4', 'U_Y', '4', 'U_Z', '4', 'U_Magnitude', '4', 'vtkValidPointMask', '4', 'wallShearStress_X', '4', 'wallShearStress_Y', '4', 'wallShearStress_Z', '4', 'wallShearStress_Magnitude', '4', 'yPlus', '4', 'Points_X', '4', 'Points_Y', '4', 'Points_Z', '4', 'Points_Magnitude', '4']

# update the view to ensure updated data information
lineChartView1.Update()

# Properties modified on plotOverLine2Display
plotOverLine2Display.SeriesPlotCorner = ['Points_Magnitude', '0', 'Points_X', '0', 'Points_Y', '0', 'Points_Z', '0', 'U_Magnitude', '0', 'U_X', '0', 'U_Y', '0', 'U_Z', '0', 'arc_length', '0', 'epsilon', '0', 'k', '0', 'nut', '0', 'p', '0', 'vtkValidPointMask', '0', 'wallShearStress_Magnitude', '0', 'wallShearStress_X', '0', 'wallShearStress_Y', '0', 'wallShearStress_Z', '0', 'yPlus', '0']
plotOverLine2Display.SeriesLineStyle = ['Points_Magnitude', '1', 'Points_X', '1', 'Points_Y', '1', 'Points_Z', '1', 'U_Magnitude', '1', 'U_X', '1', 'U_Y', '1', 'U_Z', '1', 'arc_length', '1', 'epsilon', '1', 'k', '1', 'nut', '1', 'p', '1', 'vtkValidPointMask', '1', 'wallShearStress_Magnitude', '1', 'wallShearStress_X', '1', 'wallShearStress_Y', '1', 'wallShearStress_Z', '1', 'yPlus', '1']
plotOverLine2Display.SeriesLineThickness = ['Points_Magnitude', '2', 'Points_X', '2', 'Points_Y', '2', 'Points_Z', '2', 'U_Magnitude', '2', 'U_X', '2', 'U_Y', '2', 'U_Z', '2', 'arc_length', '2', 'epsilon', '2', 'k', '2', 'nut', '2', 'p', '2', 'vtkValidPointMask', '2', 'wallShearStress_Magnitude', '2', 'wallShearStress_X', '2', 'wallShearStress_Y', '2', 'wallShearStress_Z', '2', 'yPlus', '2']
plotOverLine2Display.SeriesMarkerStyle = ['Points_Magnitude', '0', 'Points_X', '0', 'Points_Y', '0', 'Points_Z', '0', 'U_Magnitude', '0', 'U_X', '0', 'U_Y', '0', 'U_Z', '0', 'arc_length', '0', 'epsilon', '0', 'k', '0', 'nut', '0', 'p', '0', 'vtkValidPointMask', '0', 'wallShearStress_Magnitude', '0', 'wallShearStress_X', '0', 'wallShearStress_Y', '0', 'wallShearStress_Z', '0', 'yPlus', '0']
plotOverLine2Display.SeriesMarkerSize = ['Points_Magnitude', '4', 'Points_X', '4', 'Points_Y', '4', 'Points_Z', '4', 'U_Magnitude', '4', 'U_X', '4', 'U_Y', '4', 'U_Z', '4', 'arc_length', '4', 'epsilon', '4', 'k', '4', 'nut', '4', 'p', '4', 'vtkValidPointMask', '4', 'wallShearStress_Magnitude', '4', 'wallShearStress_X', '4', 'wallShearStress_Y', '4', 'wallShearStress_Z', '4', 'yPlus', '4']

# hide data in view
Hide(plotOverLine1, lineChartView1)

# Properties modified on plotOverLine2Display
plotOverLine2Display.SeriesVisibility = ['arc_length', 'epsilon', 'k', 'nut', 'p', 'Points_Magnitude', 'Points_X', 'Points_Y', 'Points_Z', 'U_Magnitude', 'U_X', 'U_Y', 'U_Z', 'vtkValidPointMask', 'wallShearStress_Magnitude', 'wallShearStress_X', 'wallShearStress_Y', 'wallShearStress_Z', 'yPlus']

# Properties modified on plotOverLine2Display
plotOverLine2Display.SeriesVisibility = []

# Properties modified on plotOverLine2Display
plotOverLine2Display.SeriesVisibility = ['U_X']

# layout/tab size in pixels
layout1.SetSize(1487, 770)

# save screenshot
SaveScreenshot('/home/anton/OpenFOAM/anton-11/run/Screenshots_temp/Geschwindigkeitsprofil_plot.png', lineChartView1, ImageResolution=[743, 770],
    OverrideColorPalette='WhiteBackground')

# Properties modified on plotOverLine2Display
plotOverLine2Display.SeriesVisibility = []

# Properties modified on plotOverLine2Display
plotOverLine2Display.SeriesVisibility = ['k']

# Properties modified on plotOverLine2Display
plotOverLine2Display.SeriesVisibility = ['epsilon', 'k']

# Properties modified on plotOverLine2Display
plotOverLine2Display.SeriesVisibility = ['epsilon', 'k', 'nut']

# layout/tab size in pixels
layout1.SetSize(1487, 770)

# save screenshot
SaveScreenshot('/home/anton/OpenFOAM/anton-11/run/Screenshots_temp/k_epsilon_nut_plot.png', lineChartView1, ImageResolution=[743, 770],
    OverrideColorPalette='WhiteBackground')

# Properties modified on plotOverLine2Display
plotOverLine2Display.SeriesVisibility = ['k', 'nut']

# Properties modified on plotOverLine2Display
plotOverLine2Display.SeriesVisibility = ['k']

# Properties modified on plotOverLine2Display
plotOverLine2Display.SeriesVisibility = []

# Properties modified on plotOverLine2Display
plotOverLine2Display.SeriesVisibility = ['wallShearStress_Magnitude']

# layout/tab size in pixels
layout1.SetSize(1487, 770)

# save screenshot
SaveScreenshot('/home/anton/OpenFOAM/anton-11/run/Screenshots_temp/wallShearStress_plot.png', lineChartView1, ImageResolution=[743, 770],
    OverrideColorPalette='WhiteBackground')

# Properties modified on plotOverLine2Display
plotOverLine2Display.SeriesVisibility = []

# Properties modified on plotOverLine2Display
plotOverLine2Display.SeriesVisibility = ['yPlus']

# layout/tab size in pixels
layout1.SetSize(1487, 770)

# save screenshot
SaveScreenshot('/home/anton/OpenFOAM/anton-11/run/Screenshots_temp/yPlus_plot.png', lineChartView1, ImageResolution=[743, 770],
    OverrideColorPalette='WhiteBackground')

#================================================================
# addendum: following script captures some of the application
# state to faithfully reproduce the visualization during playback
#================================================================

#--------------------------------
# saving layout sizes for layouts

# layout/tab size in pixels
layout1.SetSize(1487, 770)

#-----------------------------------
# saving camera placements for views

# current camera placement for renderView1
renderView1.CameraPosition = [0.25, 0.05000000074505806, 0.9902443432590722]
renderView1.CameraFocalPoint = [0.25, 0.05000000074505806, 0.004999999888241291]
renderView1.CameraParallelScale = 0.2550000001438985

#--------------------------------------------
# uncomment the following to render all views
# RenderAllViews()
# alternatively, if you want to write images, you can use SaveScreenshot(...).