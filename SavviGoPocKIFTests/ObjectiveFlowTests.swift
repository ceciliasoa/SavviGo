//
//  ObjectiveFlowTests.swift
//  SavviGoPocKIFTests
//
//  Created by Cecilia Soares on 06/06/23.
//

import XCTest
import KIF

class ObjectiveFlowTests: KIFTestCase {
    func testFlow() {
        tester().waitForView(withAccessibilityLabel: "Objetivo")
        tester().tapView(withAccessibilityLabel: "Add")
        
        tester().waitForView(withAccessibilityLabel: "Dê um nome para o seu objetivo!")
        tester().tapView(withAccessibilityLabel: "próximo")
        
        tester().waitForView(withAccessibilityLabel: "Quanto você precisa para o seu objetivo?")
        tester().tapView(withAccessibilityLabel: "próximo")
        
        tester().waitForView(withAccessibilityLabel: "Com que frequência quer guardar?")
        tester().tapView(withAccessibilityLabel: "salvar")
        tester().waitForView(withAccessibilityLabel: "Objetivo")
    }
    
    func testAddNameFlow() {
        tester().waitForView(withAccessibilityLabel: "Objetivo")
        tester().tapView(withAccessibilityLabel: "Add")
        tester().waitForView(withAccessibilityLabel: "Dê um nome para o seu objetivo!")
        tester().tapView(withAccessibilityLabel: "nameTextField")
        tester().enterText("Carro", intoViewWithAccessibilityLabel: "nameTextField", traits: UITextField.accessibilityTraits(), expectedResult: "Carro")
    }
    
}
