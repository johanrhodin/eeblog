package EEBlog "Models for electrical engineering blog post"
  extends Modelica.Icons.Library;

  package Components "Components used in the models"
    extends Modelica.Icons.Library;

    model Rectifier "A rectifier using diodes"
      Modelica.Electrical.Analog.Ideal.IdealDiode diode1 annotation(Placement(visible = true, transformation(origin = {-10, 12.5}, extent = {{-10, -10}, {10, 10}}, rotation = 45)));
      Modelica.Electrical.Analog.Ideal.IdealDiode diode3 annotation(Placement(visible = true, transformation(origin = {-9.141999999999999, -7.5}, extent = {{-10, -10}, {10, 10}}, rotation = -225)));
      Modelica.Electrical.Analog.Interfaces.PositivePin DCPinPositive annotation(Placement(visible = true, transformation(origin = {60, 25}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Electrical.Analog.Interfaces.NegativePin DCNegativePin annotation(Placement(visible = true, transformation(origin = {60, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Electrical.Analog.Interfaces.NegativePin acPin2 annotation(Placement(visible = true, transformation(origin = {-60, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Electrical.Analog.Interfaces.PositivePin acPin1 annotation(Placement(visible = true, transformation(origin = {-60, 5.119}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Electrical.Analog.Ideal.IdealDiode diode4 annotation(Placement(visible = true, transformation(origin = {10, -7.5}, extent = {{-10, -10}, {10, 10}}, rotation = 45)));
      Modelica.Electrical.Analog.Ideal.IdealDiode diode2 annotation(Placement(visible = true, transformation(origin = {10, 12.5}, extent = {{-10, -10}, {10, 10}}, rotation = -225)));
    equation
      connect(diode2.n, DCPinPositive) annotation(Line(visible = true, origin = {21.953, 23.19}, points = {{-19.024, -3.619}, {-19.024, 1.81}, {38.047, 1.81}}, color = {0, 0, 255}));
      connect(diode2.p, diode4.n) annotation(Line(visible = true, origin = {17.071, 2.5}, points = {{0, 2.929}, {0, -2.929}}, color = {0, 0, 255}));
      connect(diode1.n, diode2.n) annotation(Line(visible = true, origin = {0, 19.571}, points = {{-2.929, 0}, {2.929, 0}}, color = {0, 0, 255}));
      connect(diode4.p, DCNegativePin) annotation(Line(visible = true, origin = {21.953, -18.19}, points = {{-19.024, 3.619}, {-19.024, -1.81}, {38.047, -1.81}}, color = {0, 0, 255}));
      connect(diode4.n, acPin2) annotation(Line(visible = true, origin = {7.179, -29.521}, points = {{9.891999999999999, 29.092}, {9.891999999999999, -10.479}, {-67.179, -10.479}}, color = {0, 0, 255}));
      connect(diode4.p, diode3.p) annotation(Line(visible = true, origin = {-0.431, -14.571}, points = {{3.36, -0}, {-1.64, -0}}, color = {0, 0, 255}));
      connect(diode1.p, acPin1) annotation(Line(visible = true, origin = {-42.357, 6.119}, points = {{25.286, -0.6899999999999999}, {-12.643, -0.6899999999999999}, {-17.643, -1}}, color = {0, 0, 255}));
      connect(diode1.p, diode3.n) annotation(Line(visible = true, origin = {-16.785, 1.524}, points = {{-0.286, 3.905}, {-0.286, -1.953}, {0.572, -1.953}}, color = {0, 0, 255}));
      annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = false, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, origin = {-25, 0}, points = {{-25, 0}, {25, 50}, {75, 0}, {25, -50}, {-25, 0}, {-75, 0}}), Line(visible = true, origin = {75, 0}, points = {{-25, 0}, {25, 0}}), Line(visible = true, origin = {-80, -23.398}, points = {{-20, -6.602}, {-10, 13.398}, {-0, -13.592}, {10, 13.398}, {20, -6.602}}, smooth = Smooth.Bezier), Line(visible = true, origin = {70, -10}, points = {{-20, 0}, {20, 0}}), Line(visible = true, origin = {56.101, -20}, points = {{-6.101, 0}, {6.101, 0}}), Line(visible = true, origin = {70, -20}, points = {{-6.101, 0}, {6.101, 0}}), Line(visible = true, origin = {83.899, -20}, points = {{-6.101, 0}, {6.101, 0}})}), Diagram(coordinateSystem(extent = {{-75, -50}, {75, 50}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
    end Rectifier;

    model RectifierWithCapacitor "A rectifier with a capacitor to smooth the output"
      extends EEBlog.Components.Rectifier;
      Modelica.Electrical.Analog.Basic.Capacitor capacitor(C = 0.1) annotation(Placement(visible = true, transformation(origin = {40, -0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    equation
      connect(capacitor.n, DCNegativePin) annotation(Line(visible = true, origin = {46.667, -16.667}, points = {{-6.667, 6.667}, {-6.667, -3.333}, {13.333, -3.333}}, color = {0, 0, 255}));
      connect(DCPinPositive, capacitor.p) annotation(Line(visible = true, origin = {46.667, 20}, points = {{13.333, 5}, {-6.667, 5}, {-6.667, -10}}, color = {0, 0, 255}));
      annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, origin = {60.21, 20}, points = {{-9.525, 13.016}, {9.789999999999999, 13.016}, {-0.265, 13.016}, {-0.265, -13.016}, {-9.525, -13.016}, {9.789999999999999, -13.016}})}), Diagram(coordinateSystem(extent = {{-75, -50}, {75, 50}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
    end RectifierWithCapacitor;

    model RLC "A circuit with one resistor, one inductor and one capacitor"
      Modelica.Electrical.Analog.Basic.Resistor resistor(R = r1) annotation(Placement(visible = true, transformation(origin = {40, -0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
      Modelica.Electrical.Analog.Basic.Inductor inductor(L = l1) annotation(Placement(visible = true, transformation(origin = {-10, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Capacitor capacitor(C = c1) annotation(Placement(visible = true, transformation(origin = {10, -0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
      parameter Modelica.SIunits.Resistance r1 = 10 ^ 4;
      parameter Modelica.SIunits.Inductance l1 = 10 ^ 10 - 3;
      parameter Modelica.SIunits.Capacitance c1 = 1 * 10 ^ (-9);
      Modelica.Electrical.Analog.Basic.Ground ground annotation(Placement(visible = true, transformation(origin = {-40, -35}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Electrical.Analog.Sources.SineVoltage sineVoltage(freqHz = 60, V = 5) annotation(Placement(visible = true, transformation(origin = {-40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    equation
      connect(capacitor.n, sineVoltage.n) annotation(Line(visible = true, origin = {-15, -15}, points = {{25, 5}, {25, -5}, {-25, -5}, {-25, 5}}, color = {0, 0, 255}));
      connect(resistor.n, sineVoltage.n) annotation(Line(visible = true, origin = {0, -18.5}, points = {{40, 8.5}, {40, -1.5}, {-40, -1.5}, {-40, 8.5}}, color = {0, 0, 255}));
      connect(sineVoltage.n, ground.p) annotation(Line(visible = true, origin = {-40, -17.5}, points = {{0, 7.5}, {0, -7.5}}, color = {0, 0, 255}));
      connect(inductor.p, sineVoltage.p) annotation(Line(visible = true, origin = {-33.333, 16.667}, points = {{13.333, 3.333}, {-6.667, 3.333}, {-6.667, -6.667}}, color = {0, 0, 255}));
      connect(inductor.n, resistor.p) annotation(Line(visible = true, origin = {26.667, 16.667}, points = {{-26.667, 3.333}, {13.333, 3.333}, {13.333, -6.667}}, color = {0, 0, 255}));
      connect(inductor.n, capacitor.p) annotation(Line(visible = true, origin = {6.667, 16.667}, points = {{-6.667, 3.333}, {3.333, 3.333}, {3.333, -6.667}}, color = {0, 0, 255}));
      annotation(experiment(StopTime = 0.1), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = false, initialScale = 0.1, grid = {10, 10})), Diagram(coordinateSystem(extent = {{-60, -40}, {60, 40}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
    end RLC;

    model RCFilter "A simple lowpass filter"
      Modelica.Electrical.Analog.Basic.Resistor resistor(R = r1) annotation(Placement(visible = true, transformation(origin = {-20, 20}, extent = {{-10, -10}, {10, 10}}, rotation = -360)));
      Modelica.Electrical.Analog.Basic.Capacitor capacitor(C = c1) annotation(Placement(visible = true, transformation(origin = {10, -0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
      parameter Modelica.SIunits.Resistance r1 = 10 ^ 4;
      parameter Modelica.SIunits.Capacitance c1 = 10 ^ (-9);
      Modelica.Electrical.Analog.Interfaces.PositivePin pIn "Postive pin on the input side" annotation(Placement(visible = true, transformation(origin = {-60, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Electrical.Analog.Interfaces.PositivePin pOut "Postive pin on the output side" annotation(Placement(visible = true, transformation(origin = {60, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Electrical.Analog.Interfaces.NegativePin nOut "Negative pin on the output side" annotation(Placement(visible = true, transformation(origin = {60, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Electrical.Analog.Interfaces.NegativePin nIn "Negative Pin on the input side" annotation(Placement(visible = true, transformation(origin = {-60, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(capacitor.n, nIn) annotation(Line(visible = true, origin = {-13.333, -16.667}, points = {{23.333, 6.667}, {23.333, -3.333}, {-46.667, -3.333}}, color = {0, 0, 255}));
      connect(capacitor.n, nOut) annotation(Line(visible = true, origin = {26.667, -16.667}, points = {{-16.667, 6.667}, {-16.667, -3.333}, {33.333, -3.333}}, color = {0, 0, 255}));
      connect(capacitor.p, pOut) annotation(Line(visible = true, origin = {26.667, 16.667}, points = {{-16.667, -6.667}, {-16.667, 3.333}, {33.333, 3.333}}, color = {0, 0, 255}));
      connect(resistor.p, pIn) annotation(Line(visible = true, origin = {-45, 20}, points = {{15, 0}, {-15, 0}}, color = {0, 0, 255}));
      connect(capacitor.p, resistor.n) annotation(Line(visible = true, origin = {3.333, 16.667}, points = {{6.667, -6.667}, {6.667, 3.333}, {-13.333, 3.333}}, color = {0, 0, 255}));
      annotation(experiment(StopTime = 0.1), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = false, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, fillColor = {255, 255, 255}, extent = {{-100, -100}, {100, 100}}), Line(visible = true, origin = {0, 9.44}, points = {{-80, 30.56}, {0, 30.56}, {24.043, 10.56}, {30, -13.647}, {30, -59.44}}, smooth = Smooth.Bezier), Line(visible = true, origin = {0, -50}, points = {{80, 0}, {-80, 0}}), Line(visible = true, origin = {-80, 15}, rotation = -270, points = {{65, 0}, {-65, 0}}), Text(visible = true, origin = {0, 125}, extent = {{-100, -25}, {100, 25}}, textString = "%name")}), Diagram(coordinateSystem(extent = {{-60, -40}, {60, 40}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
    end RCFilter;

    model BaseRectifier "A rectifier with diodes"
      Modelica.Electrical.Analog.Ideal.IdealDiode diode1 annotation(Placement(visible = true, transformation(origin = {-10, 12.5}, extent = {{-10, -10}, {10, 10}}, rotation = 45)));
      Modelica.Electrical.Analog.Ideal.IdealDiode diode3 annotation(Placement(visible = true, transformation(origin = {-9.141999999999999, -7.5}, extent = {{-10, -10}, {10, 10}}, rotation = -225)));
      Modelica.Electrical.Analog.Interfaces.PositivePin DCPinPositive annotation(Placement(visible = true, transformation(origin = {60, 25}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Electrical.Analog.Interfaces.NegativePin DCNegativePin annotation(Placement(visible = true, transformation(origin = {60, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Electrical.Analog.Interfaces.NegativePin acPin2 annotation(Placement(visible = true, transformation(origin = {-60, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Electrical.Analog.Interfaces.PositivePin acPin1 annotation(Placement(visible = true, transformation(origin = {-60, 5.119}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Electrical.Analog.Ideal.IdealDiode diode4 annotation(Placement(visible = true, transformation(origin = {10, -7.5}, extent = {{-10, -10}, {10, 10}}, rotation = 45)));
      Modelica.Electrical.Analog.Ideal.IdealDiode diode2 annotation(Placement(visible = true, transformation(origin = {10, 12.5}, extent = {{-10, -10}, {10, 10}}, rotation = -225)));
    equation
      connect(diode2.p, diode4.n) annotation(Line(visible = true, origin = {17.071, 2.5}, points = {{0, 2.929}, {0, -2.929}}, color = {0, 0, 255}));
      connect(diode1.n, diode2.n) annotation(Line(visible = true, origin = {0, 19.571}, points = {{-2.929, 0}, {2.929, 0}}, color = {0, 0, 255}));
      connect(diode4.p, DCNegativePin) annotation(Line(visible = true, origin = {21.953, -18.19}, points = {{-19.024, 3.619}, {-19.024, -1.81}, {38.047, -1.81}}, color = {0, 0, 255}));
      connect(diode4.n, acPin2) annotation(Line(visible = true, origin = {7.179, -29.521}, points = {{9.891999999999999, 29.092}, {9.891999999999999, -10.479}, {-67.179, -10.479}}, color = {0, 0, 255}));
      connect(diode4.p, diode3.p) annotation(Line(visible = true, origin = {-0.431, -14.571}, points = {{3.36, -0}, {-1.64, -0}}, color = {0, 0, 255}));
      connect(diode1.p, diode3.n) annotation(Line(visible = true, origin = {-16.785, 1.524}, points = {{-0.286, 3.905}, {-0.286, -1.953}, {0.572, -1.953}}, color = {0, 0, 255}));
      annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = false, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, origin = {-25, 0}, points = {{-25, 0}, {25, 50}, {75, 0}, {25, -50}, {-25, 0}, {-75, 0}}), Line(visible = true, origin = {75, 0}, points = {{-25, 0}, {25, 0}}), Line(visible = true, origin = {-80, -23.398}, points = {{-20, -6.602}, {-10, 13.398}, {-0, -13.592}, {10, 13.398}, {20, -6.602}}, smooth = Smooth.Bezier), Line(visible = true, origin = {70, -10}, points = {{-20, 0}, {20, 0}}), Line(visible = true, origin = {56.101, -20}, points = {{-6.101, 0}, {6.101, 0}}), Line(visible = true, origin = {70, -20}, points = {{-6.101, 0}, {6.101, 0}}), Line(visible = true, origin = {83.899, -20}, points = {{-6.101, 0}, {6.101, 0}})}), Diagram(coordinateSystem(extent = {{-75, -50}, {75, 50}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
    end BaseRectifier;

    model RectifierWithCalculation "Rectifier with efficiency calculations"
      extends EEBlog.Components.BaseRectifier;
      Modelica.Electrical.Analog.Basic.Capacitor capacitor(C = 0.01) annotation(Placement(visible = true, transformation(origin = {40, -0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
      Modelica.Electrical.Analog.Sensors.PowerSensor inputPower annotation(Placement(visible = true, transformation(origin = {-37.835, 5}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
      Modelica.Electrical.Analog.Sensors.PowerSensor outputPower annotation(Placement(visible = true, transformation(origin = {36.544, 25}, extent = {{10, 10}, {-10, -10}}, rotation = -360)));
      Modelica.Blocks.Continuous.Integrator inPower annotation(Placement(visible = true, transformation(origin = {-25, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Continuous.Integrator outPower annotation(Placement(visible = true, transformation(origin = {30, 55}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Division efficiency annotation(Placement(visible = true, transformation(origin = {90.0, 65.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      Modelica.Blocks.Math.Add add1 annotation(Placement(visible = true, transformation(origin = {60.0, 90.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      Modelica.Blocks.Sources.Constant const(k = Modelica.Constants.eps) annotation(Placement(visible = true, transformation(origin = {10.0, 90.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
    equation
      connect(add1.y, efficiency.u2) annotation(Line(visible = true, origin = {74.75, 74.5}, points = {{-3.75, 15.5}, {0.25, 15.5}, {0.25, -15.5}, {3.25, -15.5}}, color = {0, 0, 127}));
      connect(inPower.y, add1.u2) annotation(Line(visible = true, origin = {23.1429, 70.075}, points = {{-37.1429, -20.075}, {-18.1429, -20.075}, {-18.1429, -1.8125}, {11.8571, -1.8125}, {11.8571, 14.925}, {24.8571, 14.925}, {24.8571, 13.925}}, color = {0, 0, 127}));
      connect(const.y, add1.u1) annotation(Line(visible = true, origin = {39.75, 93.0}, points = {{-18.75, -3.0}, {5.25, -3.0}, {5.25, 3.0}, {8.25, 3.0}}, color = {0, 0, 127}));
      connect(efficiency.u1, outPower.y) annotation(Line(visible = true, origin = {51.75, 63.0}, points = {{26.25, 8.0}, {-7.75, 8.0}, {-7.75, -8.0}, {-10.75, -8.0}}, color = {0, 0, 127}));
      connect(outputPower.power, outPower.u) annotation(Line(visible = true, origin = {27.417, 44.8}, points = {{17.126, -8.800000000000001}, {17.126, -5.8}, {-12.417, -5.8}, {-12.417, 10.2}, {-9.417, 10.2}}, color = {0, 0, 127}));
      connect(inPower.u, inputPower.power) annotation(Line(visible = true, origin = {-35.334, 30.8}, points = {{-1.666, 19.2}, {-4.666, 19.2}, {-4.666, -11.8}, {5.499, -11.8}, {5.499, -14.8}}, color = {0, 0, 127}));
      connect(outputPower.nv, DCPinPositive) annotation(Line(visible = true, origin = {46.217, 31.49}, points = {{-9.673999999999999, 3.51}, {-9.673999999999999, 4.735}, {2.783, 4.735}, {2.783, -6.49}, {13.783, -6.49}}, color = {0, 0, 255}));
      connect(outputPower.pv, DCNegativePin) annotation(Line(visible = true, origin = {48.272, -4.75}, points = {{-11.728, 19.75}, {-11.728, -2.25}, {11.728, -2.25}, {11.728, -15.25}}, color = {0, 0, 255}));
      connect(capacitor.p, outputPower.nc) annotation(Line(visible = true, origin = {31.436, 16.4}, points = {{8.564, -6.4}, {8.564, -5.4}, {-6.117, -5.4}, {-6.117, 8.6}, {-4.892, 8.6}}, color = {0, 0, 255}));
      connect(outputPower.pc, DCPinPositive) annotation(Line(visible = true, origin = {53.272, 25}, points = {{-6.728, 0}, {6.728, 0}}, color = {0, 0, 255}));
      connect(diode2.n, outputPower.nc) annotation(Line(visible = true, origin = {20.028, 22.286}, points = {{-17.099, -2.714}, {5.291, -2.714}, {5.291, 2.714}, {6.516, 2.714}}, color = {0, 0, 255}));
      connect(inputPower.nv, acPin1) annotation(Line(visible = true, origin = {-48.918, 20.03}, points = {{11.082, -5.03}, {11.082, 9.970000000000001}, {-11.082, 9.970000000000001}, {-11.082, -14.911}}, color = {0, 0, 255}));
      connect(inputPower.pv, acPin2) annotation(Line(visible = true, origin = {-48.918, -24.75}, points = {{11.082, 19.75}, {11.082, -2.25}, {-11.082, -2.25}, {-11.082, -15.25}}, color = {0, 0, 255}));
      connect(inputPower.pc, diode1.p) annotation(Line(visible = true, origin = {-23.798, 5.214}, points = {{-4.038, -0.214}, {-1.344, -0.214}, {-1.344, 0.214}, {6.727, 0.214}}, color = {0, 0, 255}));
      connect(acPin1, inputPower.nc) annotation(Line(visible = true, origin = {-55.945, 5.04}, points = {{-4.055, 0.079}, {-4.055, -0.04}, {8.109999999999999, -0.04}}, color = {0, 0, 255}));
      connect(capacitor.n, DCNegativePin) annotation(Line(visible = true, origin = {46.667, -16.667}, points = {{-6.667, 6.667}, {-6.667, -3.333}, {13.333, -3.333}}, color = {0, 0, 255}));
      annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, origin = {60.21, 20}, points = {{-9.525, 13.016}, {9.789999999999999, 13.016}, {-0.265, 13.016}, {-0.265, -13.016}, {-9.525, -13.016}, {9.789999999999999, -13.016}})}), Diagram(coordinateSystem(extent = {{-75, -50}, {75, 50}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
    end RectifierWithCalculation;

    model LowpassFilter "A lowpass filter"
      extends MathematicaExamples.Modeling.ElectricCircuit.Components.LowpassFilter(C1 = 0.9239000000000001, C2 = 1.08);
      Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage1 annotation(Placement(visible = true, transformation(origin = {-106.825, -27.7472}, extent = {{-10.0, 10.0}, {10.0, -10.0}}, rotation = 270)));
      Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor1 annotation(Placement(visible = true, transformation(origin = {74.3417, -51.8583}, extent = {{-10.0, 10.0}, {10.0, -10.0}}, rotation = 270)));
      Modelica.Blocks.Interfaces.RealOutput Vo annotation(Placement(visible = true, transformation(origin = {102.5778, -51.8583}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {90.0, -0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput Vi annotation(Placement(visible = true, transformation(origin = {-140.0, -27.659}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0), iconTransformation(origin = {-80.0, 0.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Ground G2 annotation(Placement(visible = true, transformation(origin = {-106.825, -53.1611}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Ground G3 annotation(Placement(visible = true, transformation(origin = {74.3417, -78.3306}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
    equation
      connect(p, signalVoltage1.p) annotation(Line(visible = true, origin = {-110.0, 25.0}, points = {{24.3417, -45.0}, {3.175, -42.7472}}, color = {0, 0, 255}));
      connect(signalVoltage1.v, Vi) annotation(Line(visible = true, origin = {-125.7042, 10.0}, points = {{11.8792, -37.7472}, {-14.2958, -37.659}}, color = {0, 0, 127}));
      connect(voltageSensor1.v, Vo) annotation(Line(visible = true, origin = {93.4597, -51.8583}, points = {{-9.118, 0.0}, {9.1181, 0.0}}, color = {0, 0, 127}));
      connect(voltageSensor1.n, G3.p) annotation(Line(visible = true, origin = {74.3417, -65.09439999999999}, points = {{0.0, 3.2361}, {0.0, -3.2361}}, color = {0, 0, 255}));
      connect(n, voltageSensor1.p) annotation(Line(visible = true, origin = {74.3417, -27.4153}, points = {{-0.0, 14.4431}, {0.0, -14.4431}}, color = {0, 0, 255}));
      connect(G2.p, signalVoltage1.n) annotation(Line(visible = true, origin = {-106.825, -40.4542}, points = {{0.0, -2.7069}, {0.0, 2.7069}}, color = {0, 0, 255}));
    end LowpassFilter;

    model ActiveLowpassFilter "Lowpass filter using an op-amp"
      extends MathematicaExamples.Modeling.ElectricCircuit.Components.LowpassFilter(C1 = 0.9239000000000001, C2 = 1.08);
      Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage1 annotation(Placement(visible = true, transformation(origin = {-106.825, -27.7472}, extent = {{-10.0, 10.0}, {10.0, -10.0}}, rotation = 270)));
      Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor1 annotation(Placement(visible = true, transformation(origin = {74.3417, -51.8583}, extent = {{-10.0, 10.0}, {10.0, -10.0}}, rotation = 270)));
      Modelica.Blocks.Interfaces.RealOutput Vo annotation(Placement(visible = true, transformation(origin = {102.5778, -51.8583}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {90.0, -0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput Vi annotation(Placement(visible = true, transformation(origin = {-140.0, -27.659}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0), iconTransformation(origin = {-80.0, 0.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Ground G2 annotation(Placement(visible = true, transformation(origin = {-106.825, -53.1611}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Ground G3 annotation(Placement(visible = true, transformation(origin = {74.3417, -78.3306}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
    equation
      connect(p, signalVoltage1.p) annotation(Line(visible = true, origin = {-110.0, 25.0}, points = {{24.3417, -45.0}, {3.175, -42.7472}}, color = {0, 0, 255}));
      connect(signalVoltage1.v, Vi) annotation(Line(visible = true, origin = {-125.7042, 10.0}, points = {{11.8792, -37.7472}, {-14.2958, -37.659}}, color = {0, 0, 127}));
      connect(voltageSensor1.v, Vo) annotation(Line(visible = true, origin = {93.4597, -51.8583}, points = {{-9.118, 0.0}, {9.1181, 0.0}}, color = {0, 0, 127}));
      connect(voltageSensor1.n, G3.p) annotation(Line(visible = true, origin = {74.3417, -65.09439999999999}, points = {{0.0, 3.2361}, {0.0, -3.2361}}, color = {0, 0, 255}));
      connect(n, voltageSensor1.p) annotation(Line(visible = true, origin = {74.3417, -27.4153}, points = {{-0.0, 14.4431}, {0.0, -14.4431}}, color = {0, 0, 255}));
      connect(G2.p, signalVoltage1.n) annotation(Line(visible = true, origin = {-106.825, -40.4542}, points = {{0.0, -2.7069}, {0.0, 2.7069}}, color = {0, 0, 255}));
    end ActiveLowpassFilter;

    model DCMotor "Dynamic model of a DC motor"
      Modelica.Electrical.Analog.Basic.Resistor resistor1 annotation(Placement(visible = true, transformation(origin = {-15.0, 20.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Inductor inductor1 annotation(Placement(visible = true, transformation(origin = {15.0, 20.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.EMF EMF1 annotation(Placement(visible = true, transformation(origin = {40.0, -0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Ground ground1 annotation(Placement(visible = true, transformation(origin = {-15.0, -35.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Components.Inertia inertia1 annotation(Placement(visible = true, transformation(origin = {70.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      Modelica.Electrical.Analog.Interfaces.NegativePin nPin annotation(Placement(visible = true, transformation(origin = {-100.0, -20.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-100.0, -50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      Modelica.Electrical.Analog.Interfaces.PositivePin pPin annotation(Placement(visible = true, transformation(origin = {-100.0, 20.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-100.0, 50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b1 annotation(Placement(visible = true, transformation(origin = {100.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {100.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
    equation
      connect(inertia1.flange_b, flange_b1) annotation(Line(visible = true, origin = {90.0, 0.0}, points = {{-10.0, 0.0}, {10.0, 0.0}}));
      connect(resistor1.p, pPin) annotation(Line(visible = true, origin = {-62.5, 20.0}, points = {{37.5, 0.0}, {-37.5, 0.0}}, color = {0, 0, 255}));
      connect(ground1.p, nPin) annotation(Line(visible = true, origin = {-43.3333, -21.6667}, points = {{28.3333, -3.3333}, {28.3333, 1.6667}, {-56.6667, 1.6667}}, color = {0, 0, 255}));
      connect(EMF1.n, ground1.p) annotation(Line(visible = true, origin = {12.5, -19.75}, points = {{27.5, 9.75}, {27.5, -2.25}, {-27.5, -2.25}, {-27.5, -5.25}}, color = {0, 0, 255}));
      connect(resistor1.n, inductor1.p) annotation(Line(visible = true, origin = {-0.0, 20.0}, points = {{-5.0, -0.0}, {5.0, 0.0}}, color = {0, 0, 255}));
      connect(inductor1.n, EMF1.p) annotation(Line(visible = true, origin = {35.0, 16.6667}, points = {{-10.0, 3.3333}, {5.0, 3.3333}, {5.0, -6.6667}}, color = {0, 0, 255}));
      connect(EMF1.flange, inertia1.flange_a) annotation(Line(visible = true, origin = {55.0, -0.0}, points = {{-5.0, -0.0}, {5.0, 0.0}}));
      annotation(experiment(StartTime = 0.0, StopTime = 25), Documentation(info = "<html><p>A simple dynamic model of a controlled DC motor consisting of a variable voltage source, a resistor, an inductor, and an electro-motoric force element representing the coupling between electric energy and mechanical energy provided by the magnetic field in the DC motor. The motor axis is represented by a rotating inertia.</p>
    ", revisions = ""), Diagram(coordinateSystem(extent = {{-100.0, -60.0}, {100.0, 60.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})), Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, fillPattern = FillPattern.Solid, extent = {{-100.0, -150.0}, {100.0, -110.0}}, textString = "%name", fontName = "Arial"), Rectangle(visible = true, lineColor = {112, 31, 0}, fillColor = {255, 85, 0}, pattern = LinePattern.None, fillPattern = FillPattern.HorizontalCylinder, lineThickness = 0, extent = {{-50.0, -75.0}, {75.0, 75.0}}), Polygon(visible = true, lineColor = {50, 16, 0}, fillColor = {231, 58, 0}, pattern = LinePattern.None, fillPattern = FillPattern.HorizontalCylinder, lineThickness = 0, points = {{-50.0, 75.0}, {-75.0, 50.0}, {-75.0, -50.0}, {-50.0, -75.0}}), Rectangle(visible = true, lineColor = {64, 64, 64}, fillColor = {191, 191, 191}, pattern = LinePattern.None, fillPattern = FillPattern.HorizontalCylinder, lineThickness = 0, extent = {{75.0, -25.0}, {100.0, 25.0}}), Polygon(visible = true, lineColor = {51, 51, 51}, fillColor = {25, 25, 25}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, lineThickness = 0, points = {{-100.0, -100.0}, {-100.0, -87.23}, {-50.0, -87.23}, {0.0, 25.0}, {25.0, 25.0}, {75.0, -86.93000000000001}, {100.0, -86.93000000000001}, {100.0, -100.0}}), Ellipse(visible = true, fillColor = {192, 192, 192}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, lineThickness = 0, extent = {{0.0, -12.5}, {25.0, 12.5}})}));
    end DCMotor;
    annotation(Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
  end Components;

  package Examples "Examples used in the blog post"
    extends Modelica.Icons.ExamplesPackage;

    model Rectification "Rectifier used in the blog post"
      extends Modelica.Icons.Example;
      Components.Rectifier rectifier annotation(Placement(visible = true, transformation(origin = {20, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage annotation(Placement(visible = true, transformation(origin = {-20, -0}, extent = {{10, -10}, {-10, 10}}, rotation = 450)));
      Modelica.Blocks.Sources.Sine sine(freqHz = 60, amplitude = 10) annotation(Placement(visible = true, transformation(origin = {-60, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Resistor resistor(R = 10) annotation(Placement(visible = true, transformation(origin = {60, -0}, extent = {{-10, -10}, {10, 10}}, rotation = -810)));
      Modelica.Electrical.Analog.Basic.Ground ground annotation(Placement(visible = true, transformation(origin = {-20, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(resistor.n, rectifier.DCNegativePin) annotation(Line(visible = true, origin = {43.29, -9.199999999999999}, points = {{16.71, -0.8}, {16.71, -3.8}, {-10.065, -3.8}, {-10.065, 4.2}, {-13.29, 4.2}}, color = {0, 0, 255}));
      connect(rectifier.DCPinPositive, resistor.p) annotation(Line(visible = true, origin = {43.29, 9.199999999999999}, points = {{-13.29, -4.2}, {-10.065, -4.2}, {-10.065, 3.8}, {16.71, 3.8}, {16.71, 0.8}}, color = {0, 0, 255}));
      connect(rectifier.acPin2, signalVoltage.n) annotation(Line(visible = true, origin = {-3.29, -9.199999999999999}, points = {{13.29, 4.2}, {10.065, 4.2}, {10.065, -3.8}, {-16.71, -3.8}, {-16.71, -0.8}}, color = {0, 0, 255}));
      connect(rectifier.acPin1, signalVoltage.p) annotation(Line(visible = true, origin = {-3.29, 9.199999999999999}, points = {{13.29, -4.2}, {10.065, -4.2}, {10.065, 3.8}, {-16.71, 3.8}, {-16.71, 0.8}}, color = {0, 0, 255}));
      connect(signalVoltage.n, ground.p) annotation(Line(visible = true, origin = {-20, -20}, points = {{-0, 10}, {0, -10}}, color = {0, 0, 255}));
      connect(sine.y, signalVoltage.v) annotation(Line(visible = true, origin = {-38, -0}, points = {{-11, 0}, {11, 0}}, color = {0, 0, 127}));
      annotation(experiment(StopTime = 0.1), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})), Diagram(coordinateSystem(extent = {{-75, -50}, {75, 25}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
    end Rectification;

    model Rectification2 "Rectification with a capacitor in the circuit"
      extends Modelica.Icons.Example;
      Components.RectifierWithCapacitor rectifier annotation(Placement(visible = true, transformation(origin = {20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage annotation(Placement(visible = true, transformation(origin = {-20, -0}, extent = {{10, -10}, {-10, 10}}, rotation = 450)));
      Modelica.Blocks.Sources.Sine sine(freqHz = 60, amplitude = 10) annotation(Placement(visible = true, transformation(origin = {-60, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Resistor resistor(R = 10) annotation(Placement(visible = true, transformation(origin = {60, -0}, extent = {{-10, -10}, {10, 10}}, rotation = -810)));
      Modelica.Electrical.Analog.Basic.Ground ground annotation(Placement(visible = true, transformation(origin = {-20, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(rectifier.acPin1, signalVoltage.p) annotation(Line(visible = true, origin = {-3.29, 9.199999999999999}, points = {{13.29, -4.2}, {10.065, -4.2}, {10.065, 3.8}, {-16.71, 3.8}, {-16.71, 0.8}}, color = {0, 0, 255}));
      connect(resistor.n, rectifier.DCNegativePin) annotation(Line(visible = true, origin = {43.29, -9.199999999999999}, points = {{16.71, -0.8}, {16.71, -3.8}, {-10.065, -3.8}, {-10.065, 4.2}, {-13.29, 4.2}}, color = {0, 0, 255}));
      connect(rectifier.DCPinPositive, resistor.p) annotation(Line(visible = true, origin = {43.29, 9.199999999999999}, points = {{-13.29, -4.2}, {-10.065, -4.2}, {-10.065, 3.8}, {16.71, 3.8}, {16.71, 0.8}}, color = {0, 0, 255}));
      connect(rectifier.acPin2, signalVoltage.n) annotation(Line(visible = true, origin = {-3.29, -9.199999999999999}, points = {{13.29, 4.2}, {10.065, 4.2}, {10.065, -3.8}, {-16.71, -3.8}, {-16.71, -0.8}}, color = {0, 0, 255}));
      connect(signalVoltage.n, ground.p) annotation(Line(visible = true, origin = {-20, -20}, points = {{-0, 10}, {0, -10}}, color = {0, 0, 255}));
      connect(sine.y, signalVoltage.v) annotation(Line(visible = true, origin = {-38, -0}, points = {{-11, 0}, {11, 0}}, color = {0, 0, 127}));
      annotation(experiment(StopTime = 0.1), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})), Diagram(coordinateSystem(extent = {{-75, -50}, {75, 25}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
    end Rectification2;

    model AmplifierWithOpAmp "Amplifier using an op-amp to amplify an AC signal"
      extends Modelica.Icons.Example;
      Modelica.Electrical.Analog.Basic.OpAmp opAmp(vin.stateSelect = StateSelect.always, Slope = 1000) annotation(Placement(transformation(extent = {{-37.143, -5.714}, {2.857, 34.286}}, origin = {17.143, -14.286}, rotation = 0), visible = true));
      Modelica.Electrical.Analog.Basic.Resistor resistor(R = 10000, i.stateSelect = StateSelect.always) annotation(Placement(transformation(extent = {{-82.22199999999999, 8.888999999999999}, {-62.222, 28.889}}, origin = {12.222, 1.111}, rotation = 0), visible = true));
      Modelica.Electrical.Analog.Basic.Resistor resistor1(R = 30000) annotation(Placement(transformation(extent = {{-24.444, 51.111}, {-4.444, 71.111}}, origin = {-5.556, -11.111}, rotation = 0), visible = true));
      Modelica.Electrical.Analog.Sources.SineVoltage sineVoltage(V = 12, freqHz = 1000) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {-80, -20}), visible = true));
      Modelica.Electrical.Analog.Basic.Ground ground annotation(Placement(transformation(extent = {{-20, -70}, {0, -50}}, origin = {10, -10}, rotation = 0), visible = true));
      Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V = 25) annotation(Placement(transformation(extent = {{48.0, 10.0}, {68.0, 30.0}}, origin = {20.0, 12.0}, rotation = -270), visible = true));
      Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage1(V = -25) annotation(Placement(transformation(extent = {{48, -10}, {68, 10}}, origin = {0, 23}, rotation = -90), visible = true));
      Modelica.Electrical.Analog.Basic.Resistor resistor2(R = 10000) annotation(Placement(visible = true, transformation(origin = {40, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
    equation
      connect(constantVoltage.n, ground.p) annotation(Line(visible = true, origin = {-4.3333, 12.0}, points = {{4.3333, 68.0}, {4.3333, 71.0}, {-8.666700000000001, 71.0}, {-8.666700000000001, -69.0}, {4.3333, -69.0}, {4.3333, -72.0}}, color = {0, 0, 255}));
      connect(opAmp.VMax, constantVoltage.p) annotation(Line(visible = true, origin = {0.0, 37.0}, points = {{0.0, -23.0}, {0.0, 23.0}}, color = {0, 0, 255}));
      connect(constantVoltage1.n, ground.p) annotation(Line(visible = true, origin = {0, -52.5}, points = {{0, 7.5}, {0, -7.5}}, color = {0, 0, 255}));
      connect(opAmp.VMin, constantVoltage1.p) annotation(Line(visible = true, origin = {0, -19.5}, points = {{0, 5.5}, {0, -5.5}}, color = {0, 0, 255}));
      connect(ground.p, sineVoltage.n) annotation(Line(visible = true, origin = {-40, -68.5}, points = {{40, 8.5}, {40, 8.5}, {-40, 8.5}, {-40, 38.5}}, color = {0, 0, 255}));
      connect(resistor2.p, opAmp.out) annotation(Line(visible = true, origin = {33.333, -6.667}, points = {{6.667, -13.333}, {6.667, 6.667}, {-13.333, 6.667}}, color = {0, 0, 255}));
      connect(resistor1.n, resistor2.p) annotation(Line(visible = true, origin = {23.333, 26.667}, points = {{-33.333, 23.333}, {16.667, 23.333}, {16.667, -46.667}}, color = {0, 0, 255}));
      connect(resistor2.n, ground.p) annotation(Line(visible = true, points = {{15, 12.75}, {15, -7.25}, {-15, -7.25}, {-25, -7.25}}, color = {0, 0, 255}, origin = {25, -52.75}));
      connect(resistor1.p, opAmp.in_n) annotation(Line(visible = true, origin = {-36, 30}, points = {{6, 20}, {-4, 20}, {-4, -20}, {16, -20}}, color = {0, 0, 255}));
      connect(opAmp.in_p, ground.p) annotation(Line(visible = true, origin = {-30.2, -38.8}, points = {{10.2, 28.8}, {-9.800000000000001, 28.8}, {-9.800000000000001, -21.2}, {10.2, -21.2}, {30.2, -21.2}}, color = {0, 0, 255}));
      connect(opAmp.in_n, resistor.n) annotation(Line(visible = true, origin = {-34, 15}, points = {{14, -5}, {-6, -5}, {-6, 5}, {-16, 5}}, color = {0, 0, 255}));
      connect(resistor.p, sineVoltage.p) annotation(Line(points = {{6.667, 10}, {-3.333, 10}, {-3.333, -20}}, color = {0, 0, 255}, visible = true, origin = {-76.667, 10}));
      annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = false, initialScale = 0.1, grid = {10, 10})), experiment(StopTime = 0.003, Interval = 1.2e-06, Tolerance = 2e-07), Documentation(revisions = "<html>
      <dl>
      <dt>June 17, 2009</dt>
      <dd>by Susann Wolf realized</dd>
      </dl>
      </html>", info = "<div>
 <p>A model to demonstrate the use of an operational amplifier. Based on <em>Modelica.Electrical.Analog.AmplifierWithOpAmpDetailed</em>.</p>
 </div>"));
    end AmplifierWithOpAmp;

    model RectificationEfficiency "Created to calculate efficiency of the rectifier"
      extends Modelica.Icons.Example;
      Components.RectifierWithCalculation rectifier annotation(Placement(visible = true, transformation(origin = {20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage annotation(Placement(visible = true, transformation(origin = {-20, -0}, extent = {{10, -10}, {-10, 10}}, rotation = 450)));
      Modelica.Blocks.Sources.Sine sine(freqHz = 60, amplitude = 10) annotation(Placement(visible = true, transformation(origin = {-60, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Resistor resistor(R = 10) annotation(Placement(visible = true, transformation(origin = {60, -0}, extent = {{-10, -10}, {10, 10}}, rotation = -810)));
      Modelica.Electrical.Analog.Basic.Ground ground annotation(Placement(visible = true, transformation(origin = {-20, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(rectifier.acPin1, signalVoltage.p) annotation(Line(visible = true, origin = {-3.29, 9.199999999999999}, points = {{13.29, -4.2}, {10.065, -4.2}, {10.065, 3.8}, {-16.71, 3.8}, {-16.71, 0.8}}, color = {0, 0, 255}));
      connect(resistor.n, rectifier.DCNegativePin) annotation(Line(visible = true, origin = {43.29, -9.199999999999999}, points = {{16.71, -0.8}, {16.71, -3.8}, {-10.065, -3.8}, {-10.065, 4.2}, {-13.29, 4.2}}, color = {0, 0, 255}));
      connect(rectifier.DCPinPositive, resistor.p) annotation(Line(visible = true, origin = {43.29, 9.199999999999999}, points = {{-13.29, -4.2}, {-10.065, -4.2}, {-10.065, 3.8}, {16.71, 3.8}, {16.71, 0.8}}, color = {0, 0, 255}));
      connect(rectifier.acPin2, signalVoltage.n) annotation(Line(visible = true, origin = {-3.29, -9.199999999999999}, points = {{13.29, 4.2}, {10.065, 4.2}, {10.065, -3.8}, {-16.71, -3.8}, {-16.71, -0.8}}, color = {0, 0, 255}));
      connect(signalVoltage.n, ground.p) annotation(Line(visible = true, origin = {-20, -20}, points = {{-0, 10}, {0, -10}}, color = {0, 0, 255}));
      connect(sine.y, signalVoltage.v) annotation(Line(visible = true, origin = {-38, -0}, points = {{-11, 0}, {11, 0}}, color = {0, 0, 127}));
      annotation(experiment(StopTime = 0.1), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})), Diagram(coordinateSystem(extent = {{-75, -50}, {75, 25}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
    end RectificationEfficiency;

    model HelloSystemModeler "Very simple model to start with"
      extends Modelica.Icons.Example;
      Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V = 10) annotation(Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
      Modelica.Electrical.Analog.Basic.Resistor resistor(R = 5) annotation(Placement(visible = true, transformation(origin = {-20, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Ground ground annotation(Placement(visible = true, transformation(origin = {-41.868, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(ground.p, constantVoltage.n) annotation(Line(visible = true, origin = {-50.934, -22.5}, points = {{9.066000000000001, -7.5}, {9.066000000000001, -2.5}, {-9.066000000000001, -2.5}, {-9.066000000000001, 12.5}}, color = {0, 0, 255}));
      connect(constantVoltage.n, resistor.n) annotation(Line(visible = true, origin = {-28.8, -1.2}, points = {{-31.2, -8.800000000000001}, {-31.2, -13.8}, {28.8, -13.8}, {28.8, 21.2}, {18.8, 21.2}}, color = {0, 0, 255}));
      connect(constantVoltage.p, resistor.p) annotation(Line(visible = true, origin = {-50, 16.667}, points = {{-10, -6.667}, {-10, 3.333}, {20, 3.333}}, color = {0, 0, 255}));
      annotation(experiment(StopTime = 8, NumberOfIntervals = 100, Algorithm = "dassl"), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
    end HelloSystemModeler;

    model LowpassFilter "Model created to be used with WSMLinearize"
      extends MathematicaExamples.Modeling.ElectricCircuit.Components.LowpassFilter(C1 = 0.9239000000000001, C2 = 1.08);
      Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage1 annotation(Placement(visible = true, transformation(origin = {-106.825, -27.7472}, extent = {{-10.0, 10.0}, {10.0, -10.0}}, rotation = 270)));
      Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor1 annotation(Placement(visible = true, transformation(origin = {74.3417, -51.8583}, extent = {{-10.0, 10.0}, {10.0, -10.0}}, rotation = 270)));
      Modelica.Blocks.Interfaces.RealOutput Vo annotation(Placement(visible = true, transformation(origin = {102.5778, -51.8583}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {90.0, -0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput Vi annotation(Placement(visible = true, transformation(origin = {-140.0, -27.659}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0), iconTransformation(origin = {-80.0, 0.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Ground G2 annotation(Placement(visible = true, transformation(origin = {-106.825, -53.1611}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Ground G3 annotation(Placement(visible = true, transformation(origin = {74.3417, -78.3306}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
    equation
      connect(p, signalVoltage1.p) annotation(Line(visible = true, origin = {-110.0, 25.0}, points = {{24.3417, -45.0}, {3.175, -42.7472}}, color = {0, 0, 255}));
      connect(signalVoltage1.v, Vi) annotation(Line(visible = true, origin = {-125.7042, 10.0}, points = {{11.8792, -37.7472}, {-14.2958, -37.659}}, color = {0, 0, 127}));
      connect(voltageSensor1.v, Vo) annotation(Line(visible = true, origin = {93.4597, -51.8583}, points = {{-9.118, 0.0}, {9.1181, 0.0}}, color = {0, 0, 127}));
      connect(voltageSensor1.n, G3.p) annotation(Line(visible = true, origin = {74.3417, -65.09439999999999}, points = {{0.0, 3.2361}, {0.0, -3.2361}}, color = {0, 0, 255}));
      connect(n, voltageSensor1.p) annotation(Line(visible = true, origin = {74.3417, -27.4153}, points = {{-0.0, 14.4431}, {0.0, -14.4431}}, color = {0, 0, 255}));
      connect(G2.p, signalVoltage1.n) annotation(Line(visible = true, origin = {-106.825, -40.4542}, points = {{0.0, -2.7069}, {0.0, 2.7069}}, color = {0, 0, 255}));
    end LowpassFilter;

    model RectificationAndMotor "Model showing the connection between the mechanical and the electrical domains"
      extends Modelica.Icons.Example;
      EEBlog.Components.RectifierWithCapacitor rectifier annotation(Placement(visible = true, transformation(origin = {10.0, -0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage annotation(Placement(visible = true, transformation(origin = {-30.0, -0.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 450)));
      Modelica.Blocks.Sources.Sine sine(freqHz = 60, amplitude = 10) annotation(Placement(visible = true, transformation(origin = {-60, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Ground ground annotation(Placement(visible = true, transformation(origin = {-30.0, -40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      EEBlog.Components.DCMotor DCMotor1 annotation(Placement(visible = true, transformation(origin = {40.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = 0.1) annotation(Placement(visible = true, transformation(origin = {70.0, -0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      Modelica.Mechanics.Rotational.Sources.TorqueStep torqueStep1(startTime = 10, stepTorque = -1) annotation(Placement(visible = true, transformation(origin = {100.0, -0.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 360)));
    equation
      connect(rectifier.acPin1, signalVoltage.p) annotation(Line(visible = true, origin = {-13.29, 9.199999999999999}, points = {{13.29, -4.2}, {10.065, -4.2}, {10.065, 3.8}, {-16.71, 3.8}, {-16.71, 0.8}}, color = {0, 0, 255}));
      connect(rectifier.acPin2, signalVoltage.n) annotation(Line(visible = true, origin = {-13.29, -9.199999999999999}, points = {{13.29, 4.2}, {10.065, 4.2}, {10.065, -3.8}, {-16.71, -3.8}, {-16.71, -0.8}}, color = {0, 0, 255}));
      connect(rectifier.DCPinPositive, DCMotor1.pPin) annotation(Line(visible = true, origin = {25.0, 5.0}, points = {{-5.0, -0.0}, {5.0, 0.0}}, color = {0, 0, 255}));
      connect(signalVoltage.n, ground.p) annotation(Line(visible = true, origin = {-30.0, -20.0}, points = {{-0.0, 10.0}, {0.0, -10.0}}, color = {0, 0, 255}));
      connect(DCMotor1.nPin, rectifier.DCNegativePin) annotation(Line(visible = true, origin = {25.0, -5.0}, points = {{5.0, 0.0}, {-5.0, -0.0}}, color = {0, 0, 255}));
      connect(sine.y, signalVoltage.v) annotation(Line(visible = true, origin = {-48.0, -0.0}, points = {{-1.0, 0.0}, {11.0, 0.0}}, color = {0, 0, 127}));
      connect(DCMotor1.flange_b1, inertia1.flange_a) annotation(Line(visible = true, origin = {55.0, -0.0}, points = {{-5.0, 0.0}, {5.0, -0.0}}));
      connect(torqueStep1.flange, inertia1.flange_b) annotation(Line(visible = true, origin = {85.0, -0.0}, points = {{5.0, -0.0}, {-5.0, 0.0}}));
      annotation(experiment(StartTime = 0.0, StopTime = 25, NumberOfIntervals = -1, Algorithm = "dassl", Tolerance = 1e-07));
      annotation(experiment(StopTime = 0.1), Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})), Diagram(coordinateSystem(extent = {{-75.0, -50.0}, {125.0, 25.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
    end RectificationAndMotor;

    model Filter "Filter used to show fourier spectra"
      extends Modelica.Icons.Example;
      Modelica.Electrical.Analog.Basic.Resistor resistor(R = 100000) annotation(Placement(visible = true, transformation(origin = {40, -0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
      Modelica.Electrical.Analog.Basic.Ground ground annotation(Placement(visible = true, transformation(origin = {20, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -270)));
      Modelica.Electrical.Analog.Sources.SineVoltage sineVoltageLowFreq(freqHz = 600, V = 1) "Voltage with a low frequency" annotation(Placement(visible = true, transformation(origin = {-40, -15}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
      Components.RCFilter rCFilter(c1 = 1e-08) annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Electrical.Analog.Sources.SineVoltage highFrequency(V = 0.1, freqHz = 30000) "Voltage with a low frequency" annotation(Placement(visible = true, transformation(origin = {-40, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    equation
      connect(ground.p, sineVoltageLowFreq.n) annotation(Line(visible = true, origin = {-23.333, -28.333}, points = {{33.333, -1.667}, {-16.667, -1.667}, {-16.667, 3.333}}, color = {0, 0, 255}));
      connect(sineVoltageLowFreq.p, highFrequency.n) annotation(Line(visible = true, origin = {-40, -2.5}, points = {{0, -2.5}, {0, 2.5}}, color = {0, 0, 255}));
      connect(highFrequency.p, rCFilter.pIn) annotation(Line(visible = true, origin = {-23.2, 15.2}, points = {{-16.8, 4.8}, {-16.8, 7.8}, {10.2, 7.8}, {10.2, -10.2}, {13.2, -10.2}}, color = {0, 0, 255}));
      connect(rCFilter.nIn, sineVoltageLowFreq.n) annotation(Line(visible = true, origin = {-23.2, -18.2}, points = {{13.2, 13.2}, {10.2, 13.2}, {10.2, -9.800000000000001}, {-16.8, -9.800000000000001}, {-16.8, -6.8}}, color = {0, 0, 255}));
      connect(resistor.n, rCFilter.nOut) annotation(Line(visible = true, origin = {23.2, -9.199999999999999}, points = {{16.8, -0.8}, {16.8, -3.8}, {-10.2, -3.8}, {-10.2, 4.2}, {-13.2, 4.2}}, color = {0, 0, 255}));
      connect(rCFilter.pOut, resistor.p) annotation(Line(visible = true, origin = {23.2, 9.199999999999999}, points = {{-13.2, -4.2}, {-10.2, -4.2}, {-10.2, 3.8}, {16.8, 3.8}, {16.8, 0.8}}, color = {0, 0, 255}));
      annotation(experiment(StopTime = 0.01), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = false, initialScale = 0.1, grid = {10, 10})), Diagram(coordinateSystem(extent = {{-60, -45}, {60, 40}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
    end Filter;
    annotation(Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
  end Examples;
  annotation(Documentation(info = "<p>This package contains models used in a blog post published on <a href=\"http://blog.www.wolfram.com/\">blog.wolfram.com</a>.</p>
  <p class=\"legallarge\">This domain example is an informational resource made freely available by Wolfram Research.</p>
  <h3 class=\"legal\">Use of This Example</h3>
  <ul class=\"legal\">
  <li>You may not use this example for any purpose that is unlawful or dangerous.</li>
  <li>You assume total responsibility and risk for your use of this example.</li>
  <li>You may not present this example with any alteration to its trade dress, trademarks, or design.</li>
  </ul>
  <h3 class=\"legal\">License</h3>
  <p class=\"legalsmall\">All content in this bundle is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License. By accessing the content or using it in any way, you accept and agree to be bound by the terms of this license. If you do not agree to these Terms of Use, you may not use this content. Wolfram Research reserves the right to change, modify, add to, or remove portions of these Terms of Use at any time without notice. Please refer back to <a href=\"http://www.wolfram.com\">www.wolfram.com</a> for the latest Terms of Use.</p>
  <p class=\"legalsmall\">A summary of the licensing terms can be found at:<br /> <a href=\"http://creativecommons.org/licenses/by-nc-sa/3.0\">http://creativecommons.org/licenses/by-nc-sa/3.0</a></p>
  <p class=\"legalsmall\">The full legal code can be found at:<br /> <a href=\"http://creativecommons.org/licenses/by-nc-sa/3.0/legalcode\">http://creativecommons.org/licenses/by-nc-sa/3.0/legalcode</a></p>
  <div class=\"legalend\">&nbsp;</div>", revisions = ""), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end EEBlog;
