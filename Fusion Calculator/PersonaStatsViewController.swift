//
//  PersonaStatsViewController.swift
//  Fusion Calculator
//
//  Created by Andrew Ratz on 3/28/18.
//  Copyright © 2018 Andrew Ratz. All rights reserved.
//

import UIKit

import PopupDialog

struct Skill: Decodable {
    let effect: String?
    let cost: String?
    let card: String?
    let users: String?
}

struct AllSkills: Decodable {
    let PhysicalSkills: PhysicalSkills
    let MagicSkills: MagicSkills
    let HealAssistSkills: HealAssistSkills
    let PassiveSkills: PassiveSkills
}

struct PhysicalSkills: Decodable {
    let Phys: Phys
    let Gun: [String: Skill]
}

struct Phys: Decodable {
    let SingleTarget: [String: Skill]
    let MultiTarget: [String: Skill]
}

struct MagicSkills: Decodable {
    let Fire: [String: Skill]
    let Ice: [String: Skill]
    let Electric: [String: Skill]
    let Wind: [String: Skill]
    let Psychokinesis: [String: Skill]
    let Nuclear: [String: Skill]
    let Bless: [String: Skill]
    let Curse: [String: Skill]
    let Almighty: [String: Skill]
    let Ailment: Ailment
}

struct Ailment: Decodable {
    let Physiological: [String: Skill]
    let Mental: [String: Skill]
}

struct HealAssistSkills: Decodable {
    let Healing: [String: Skill]
    let Support: Support
}

struct Support: Decodable {
    let Negatable: [String: Skill]
    let NonNegatable: [String: Skill]
    let Shields: [String: Skill]
    let Negation: [String: Skill]
}

struct PassiveSkills: Decodable {
    let Counter: [String: Skill]
    let Offensive: [String: Skill]
    let Defensive: [String: Skill]
    let Evasion: [String: Skill]
    let Recovery: [String: Skill]
    let OncePerBattle: [String: Skill]
    let PostBattleEffect: [String: Skill]
}

class PersonaStatsViewController: UIViewController {
    
    @IBAction func showSkillDetails(recognizer:UITapGestureRecognizer) {
        let skillLabel = recognizer.view as! UILabel
        let skillName = skillLabel.text
        
        if (skillName == nil) {
            return
        }
        
        var effect: String?
        var cost: String?
        var card: String?
        var image: UIImage?
        
        skillsList.PhysicalSkills.Phys.SingleTarget.forEach { (currentSkill) in
            if (currentSkill.key.elementsEqual(skillName!)) {
                effect = currentSkill.value.effect
                cost = currentSkill.value.cost
                card = currentSkill.value.card
                image = UIImage.init(named: "Melee_Icon_P5")
            }
        }
        skillsList.PhysicalSkills.Phys.MultiTarget.forEach { (currentSkill) in
            if (currentSkill.key.elementsEqual(skillName!)) {
                effect = currentSkill.value.effect
                cost = currentSkill.value.cost
                card = currentSkill.value.card
                image = UIImage.init(named: "Melee_Icon_P5")
            }
        }
        skillsList.PhysicalSkills.Gun.forEach { (currentSkill) in
            if (currentSkill.key.elementsEqual(skillName!)) {
                effect = currentSkill.value.effect
                cost = currentSkill.value.cost
                card = currentSkill.value.card
                image = UIImage.init(named: "Ranged_Icon_P5")
            }
        }
        skillsList.MagicSkills.Fire.forEach { (currentSkill) in
            if (currentSkill.key.elementsEqual(skillName!)) {
                effect = currentSkill.value.effect
                cost = currentSkill.value.cost
                card = currentSkill.value.card
                image = UIImage.init(named: "Fire_Icon_P5")
            }
        }
        skillsList.MagicSkills.Ice.forEach { (currentSkill) in
            if (currentSkill.key.elementsEqual(skillName!)) {
                effect = currentSkill.value.effect
                cost = currentSkill.value.cost
                card = currentSkill.value.card
                image = UIImage.init(named: "Ice_Icon_P5")
            }
        }
        skillsList.MagicSkills.Electric.forEach { (currentSkill) in
            if (currentSkill.key.elementsEqual(skillName!)) {
                effect = currentSkill.value.effect
                cost = currentSkill.value.cost
                card = currentSkill.value.card
                image = UIImage.init(named: "Elec_Icon_P5")
            }
        }
        skillsList.MagicSkills.Wind.forEach { (currentSkill) in
            if (currentSkill.key.elementsEqual(skillName!)) {
                effect = currentSkill.value.effect
                cost = currentSkill.value.cost
                card = currentSkill.value.card
                image = UIImage.init(named: "Wind_Icon_P5")
            }
        }
        skillsList.MagicSkills.Psychokinesis.forEach { (currentSkill) in
            if (currentSkill.key.elementsEqual(skillName!)) {
                effect = currentSkill.value.effect
                cost = currentSkill.value.cost
                card = currentSkill.value.card
                image = UIImage.init(named: "Psy_Icon_P5")
            }
        }
        skillsList.MagicSkills.Nuclear.forEach { (currentSkill) in
            if (currentSkill.key.elementsEqual(skillName!)) {
                effect = currentSkill.value.effect
                cost = currentSkill.value.cost
                card = currentSkill.value.card
                image = UIImage.init(named: "Nuclear_Icon_P5")
            }
        }
        skillsList.MagicSkills.Bless.forEach { (currentSkill) in
            if (currentSkill.key.elementsEqual(skillName!)) {
                effect = currentSkill.value.effect
                cost = currentSkill.value.cost
                card = currentSkill.value.card
                image = UIImage.init(named: "Light_Icon_P5")
            }
        }
        skillsList.MagicSkills.Curse.forEach { (currentSkill) in
            if (currentSkill.key.elementsEqual(skillName!)) {
                effect = currentSkill.value.effect
                cost = currentSkill.value.cost
                card = currentSkill.value.card
                image = UIImage.init(named: "Dark_Icon_P5")
            }
        }
        skillsList.MagicSkills.Almighty.forEach { (currentSkill) in
            if (currentSkill.key.elementsEqual(skillName!)) {
                effect = currentSkill.value.effect
                cost = currentSkill.value.cost
                card = currentSkill.value.card
                image = UIImage.init(named: "Almighty_Icon_P5")
            }
        }
        skillsList.MagicSkills.Ailment.Physiological.forEach { (currentSkill) in
            if (currentSkill.key.elementsEqual(skillName!)) {
                effect = currentSkill.value.effect
                cost = currentSkill.value.cost
                card = currentSkill.value.card
                image = UIImage.init(named: "Ailment_Icon_P5")
            }
        }
        skillsList.MagicSkills.Ailment.Mental.forEach { (currentSkill) in
            if (currentSkill.key.elementsEqual(skillName!)) {
                effect = currentSkill.value.effect
                cost = currentSkill.value.cost
                card = currentSkill.value.card
                image = UIImage.init(named: "Ailment_Icon_P5")
            }
        }
        skillsList.HealAssistSkills.Healing.forEach { (currentSkill) in
            if (currentSkill.key.elementsEqual(skillName!)) {
                effect = currentSkill.value.effect
                cost = currentSkill.value.cost
                card = currentSkill.value.card
                image = UIImage.init(named: "Healing_Icon_P5")
            }
        }
        skillsList.HealAssistSkills.Support.Negatable.forEach { (currentSkill) in
            if (currentSkill.key.elementsEqual(skillName!)) {
                effect = currentSkill.value.effect
                cost = currentSkill.value.cost
                card = currentSkill.value.card
                image = UIImage.init(named: "Assist_Icon_P5")
            }
        }
        skillsList.HealAssistSkills.Support.NonNegatable.forEach { (currentSkill) in
            if (currentSkill.key.elementsEqual(skillName!)) {
                effect = currentSkill.value.effect
                cost = currentSkill.value.cost
                card = currentSkill.value.card
                image = UIImage.init(named: "Assist_Icon_P5")
            }
        }
        skillsList.HealAssistSkills.Support.Shields.forEach { (currentSkill) in
            if (currentSkill.key.elementsEqual(skillName!)) {
                effect = currentSkill.value.effect
                cost = currentSkill.value.cost
                card = currentSkill.value.card
                image = UIImage.init(named: "Assist_Icon_P5")
            }
        }
        skillsList.HealAssistSkills.Support.Negation.forEach { (currentSkill) in
            if (currentSkill.key.elementsEqual(skillName!)) {
                effect = currentSkill.value.effect
                cost = currentSkill.value.cost
                card = currentSkill.value.card
                image = UIImage.init(named: "Assist_Icon_P5")
            }
        }
        skillsList.PassiveSkills.Counter.forEach { (currentSkill) in
            if (currentSkill.key.elementsEqual(skillName!)) {
                effect = currentSkill.value.effect
                cost = currentSkill.value.cost
                card = currentSkill.value.card
                image = UIImage.init(named: "Nav_Skill_Icon_P5")
            }
        }
        skillsList.PassiveSkills.Offensive.forEach { (currentSkill) in
            if (currentSkill.key.elementsEqual(skillName!)) {
                effect = currentSkill.value.effect
                cost = currentSkill.value.cost
                card = currentSkill.value.card
                image = UIImage.init(named: "Nav_Skill_Icon_P5")
            }
        }
        skillsList.PassiveSkills.Defensive.forEach { (currentSkill) in
            if (currentSkill.key.elementsEqual(skillName!)) {
                effect = currentSkill.value.effect
                cost = currentSkill.value.cost
                card = currentSkill.value.card
                image = UIImage.init(named: "Nav_Skill_Icon_P5")
            }
        }
        skillsList.PassiveSkills.Evasion.forEach { (currentSkill) in
            if (currentSkill.key.elementsEqual(skillName!)) {
                effect = currentSkill.value.effect
                cost = currentSkill.value.cost
                card = currentSkill.value.card
                image = UIImage.init(named: "Nav_Skill_Icon_P5")
            }
        }
        skillsList.PassiveSkills.Recovery.forEach { (currentSkill) in
            if (currentSkill.key.elementsEqual(skillName!)) {
                effect = currentSkill.value.effect
                cost = currentSkill.value.cost
                card = currentSkill.value.card
                image = UIImage.init(named: "Nav_Skill_Icon_P5")
            }
        }
        skillsList.PassiveSkills.OncePerBattle.forEach { (currentSkill) in
            if (currentSkill.key.elementsEqual(skillName!)) {
                effect = currentSkill.value.effect
                cost = currentSkill.value.cost
                card = currentSkill.value.card
                image = UIImage.init(named: "Nav_Skill_Icon_P5")
            }
        }
        skillsList.PassiveSkills.PostBattleEffect.forEach { (currentSkill) in
            if (currentSkill.key.elementsEqual(skillName!)) {
                effect = currentSkill.value.effect
                cost = currentSkill.value.cost
                card = currentSkill.value.card
                image = UIImage.init(named: "Nav_Skill_Icon_P5")
            }
        }
        
        let title = skillName
        if (cost == nil) {
            cost = "None"
        }
        if (card == nil) {
            card = "Unobtainable"
        }
        //let message = "Effect: \(effect!)\nCost: \(cost!)\nCard: \(card!)"
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SkillDetails") as! SkillDetailsViewController

        let popup = PopupDialog(viewController: vc)
        let buttonOne = CancelButton(title: "Cancel") {
            print("Cancel was hit")
        }
        popup.addButton(buttonOne)
        
        /*let dialogAppearance = PopupDialogDefaultView.appearance()
        dialogAppearance.backgroundColor = UIColor.red
        dialogAppearance.titleFont = UIFont.init(name: "p5hatty", size: 24)!
        dialogAppearance.titleColor = UIColor.white
        dialogAppearance.messageFont = UIFont.init(name: "p5hatty", size: 18)!
        dialogAppearance.messageColor = UIColor.white
        
        let containerAppearance = PopupDialogContainerView.appearance()
        containerAppearance.cornerRadius = 0
        
        let overlayAppearance = PopupDialogOverlayView.appearance()
        overlayAppearance.blurEnabled = false
        overlayAppearance.opacity = 0
        */
        let buttonAppearance = CancelButton.appearance()
        buttonAppearance.titleColor = UIColor.black
        buttonAppearance.buttonColor = UIColor.white
        buttonAppearance.separatorColor = UIColor.black

        vc.titleLabel.text = title
        if (cost == "None") {
            vc.costLabel.isHidden = true
        }
        else {
            vc.costLabel.text = cost
        }
        vc.effectLabel.text = effect
        vc.imageView.image = image
        self.present(popup, animated: true, completion: nil)
        return
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var arcanaLabel: UILabel!
    
    @IBOutlet weak var levelLabel: UILabel!
    
    @IBOutlet weak var personaImage: UIImageView!
    
    
    @IBOutlet weak var physicalLabel: UILabel!
    @IBOutlet weak var gunLabel: UILabel!
    @IBOutlet weak var agiLabel: UILabel!
    @IBOutlet weak var bufuLabel: UILabel!
    @IBOutlet weak var zioLabel: UILabel!
    @IBOutlet weak var garuLabel: UILabel!
    @IBOutlet weak var psyLabel: UILabel!
    @IBOutlet weak var nuclearLabel: UILabel!
    @IBOutlet weak var hamaLabel: UILabel!
    @IBOutlet weak var mudoLabel: UILabel!
    
    
    @IBOutlet weak var physicalImage: UIImageView!
    @IBOutlet weak var gunImage: UIImageView!
    @IBOutlet weak var agiImage: UIImageView!
    @IBOutlet weak var bufuImage: UIImageView!
    @IBOutlet weak var zioImage: UIImageView!
    @IBOutlet weak var garuImage: UIImageView!
    @IBOutlet weak var psyImage: UIImageView!
    @IBOutlet weak var nuclearImage: UIImageView!
    @IBOutlet weak var hamaImage: UIImageView!
    @IBOutlet weak var mudoImage: UIImageView!
    
    @IBOutlet weak var stLabel: UILabel!
    @IBOutlet weak var maLabel: UILabel!
    @IBOutlet weak var enLabel: UILabel!
    @IBOutlet weak var agLabel: UILabel!
    @IBOutlet weak var luLabel: UILabel!
    
    @IBOutlet weak var stBar: UIView!
    @IBOutlet weak var maBar: UIView!
    @IBOutlet weak var enBar: UIView!
    @IBOutlet weak var agBar: UIView!
    @IBOutlet weak var luBar: UIView!
    
    @IBOutlet weak var stWhite: UIView!
    @IBOutlet weak var maWhite: UIView!
    @IBOutlet weak var enWhite: UIView!
    @IBOutlet weak var agWhite: UIView!
    @IBOutlet weak var luWhite: UIView!
    
    @IBOutlet weak var skill1: UILabel!
    @IBOutlet weak var skill2: UILabel!
    @IBOutlet weak var skill3: UILabel!
    @IBOutlet weak var skill4: UILabel!
    @IBOutlet weak var skill5: UILabel!
    @IBOutlet weak var skill6: UILabel!
    @IBOutlet weak var skill7: UILabel!
    @IBOutlet weak var skill8: UILabel!
    
    
    @IBOutlet weak var lv1Label: UILabel!
    @IBOutlet weak var lv2Label: UILabel!
    @IBOutlet weak var lv3Label: UILabel!
    @IBOutlet weak var lv4Label: UILabel!
    @IBOutlet weak var lv5Label: UILabel!
    @IBOutlet weak var lv6Label: UILabel!
    @IBOutlet weak var lv7Label: UILabel!
    @IBOutlet weak var lv8Label: UILabel!
    
    @IBOutlet weak var lvnum1Label: UILabel!
    @IBOutlet weak var lvnum2Label: UILabel!
    @IBOutlet weak var lvnum3Label: UILabel!
    @IBOutlet weak var lvnum4Label: UILabel!
    @IBOutlet weak var lvnum5Label: UILabel!
    @IBOutlet weak var lvnum6Label: UILabel!
    @IBOutlet weak var lvnum7Label: UILabel!
    @IBOutlet weak var lvnum8Label: UILabel!
    
    @IBOutlet weak var elem1Image: UIImageView!
    @IBOutlet weak var elem2Image: UIImageView!
    @IBOutlet weak var elem3Image: UIImageView!
    @IBOutlet weak var elem4Image: UIImageView!
    @IBOutlet weak var elem5Image: UIImageView!
    @IBOutlet weak var elem6Image: UIImageView!
    @IBOutlet weak var elem7Image: UIImageView!
    @IBOutlet weak var elem8Image: UIImageView!
    
    let steel = UIColor.init(red: 121.0/255.0, green: 121.0/255.0, blue: 121.0/255.0, alpha: 1.0) //"Steel"
    
    var skillsList: AllSkills!
    
    var pageNumber: Int!
    var persona: Persona?
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        skillsList = loadSkillsList()
        
        personaImage.image = UIImage.init(named: name!)
        
        nameLabel.text = name
        
        let strokeTextAttributes: [NSAttributedStringKey : Any] =
            [NSAttributedStringKey.strokeColor : UIColor.white, NSAttributedStringKey.foregroundColor : UIColor.black, NSAttributedStringKey.strokeWidth : -4.0,]
        if (persona!.arcana == "Hierophant") {
            arcanaLabel.attributedText = NSAttributedString(string: "Hiero.", attributes: strokeTextAttributes)
        }
        else if (persona!.arcana == "Hanged Man") {
            arcanaLabel.attributedText = NSAttributedString(string: "Hanged", attributes: strokeTextAttributes)
        }
        else if (persona!.arcana == "Temperance") {
            arcanaLabel.attributedText = NSAttributedString(string: "Temper.", attributes: strokeTextAttributes)
        }
        else if (persona!.arcana == "Judgement") {
            arcanaLabel.attributedText = NSAttributedString(string: "Judge.", attributes: strokeTextAttributes)
        }
        else {
            arcanaLabel.attributedText = NSAttributedString(string: persona!.arcana, attributes: strokeTextAttributes)
        }
        levelLabel.text = "\(persona!.level)"
        
        populateElems(physicalLabel, persona!.elems[0])
        populateElems(gunLabel, persona!.elems[1])
        populateElems(agiLabel, persona!.elems[2])
        populateElems(bufuLabel, persona!.elems[3])
        populateElems(zioLabel, persona!.elems[4])
        populateElems(garuLabel, persona!.elems[5])
        populateElems(psyLabel, persona!.elems[6])
        populateElems(nuclearLabel, persona!.elems[7])
        populateElems(hamaLabel, persona!.elems[8])
        populateElems(mudoLabel, persona!.elems[9])
        
        let sortedSkills = Array(persona!.skills).sorted { (aDic, bDic) -> Bool in
            return aDic.value < bDic.value
            }
        var i = 0
        while i < sortedSkills.count {
            populateSkills(elem1Image, skill1, lv1Label, lvnum1Label, sortedSkills[i].key, sortedSkills[i].value)
            i += 1
            if (i == sortedSkills.count - 1) {
                break
            }
            populateSkills(elem2Image, skill2, lv2Label, lvnum2Label, sortedSkills[i].key, sortedSkills[i].value)
            i += 1
            if (i == sortedSkills.count - 1) {
                break
            }
            populateSkills(elem3Image, skill3, lv3Label, lvnum3Label, sortedSkills[i].key, sortedSkills[i].value)
            i += 1
            if (i == sortedSkills.count - 1) {
                break
            }
            populateSkills(elem4Image, skill4, lv4Label, lvnum4Label, sortedSkills[i].key, sortedSkills[i].value)
            i += 1
            if (i == sortedSkills.count - 1) {
                break
            }
            populateSkills(elem5Image, skill5, lv5Label, lvnum5Label, sortedSkills[i].key, sortedSkills[i].value)
            i += 1
            if (i == sortedSkills.count - 1) {
                break
            }
            populateSkills(elem6Image, skill6, lv6Label, lvnum6Label, sortedSkills[i].key, sortedSkills[i].value)
            i += 1
            if (i == sortedSkills.count - 1) {
                break
            }
            populateSkills(elem7Image, skill7, lv7Label, lvnum7Label, sortedSkills[i].key, sortedSkills[i].value)
            i += 1
            if (i == sortedSkills.count - 1) {
                break
            }
            populateSkills(elem8Image, skill8, lv8Label, lvnum8Label, sortedSkills[i].key, sortedSkills[i].value)
            if (i == sortedSkills.count - 1) {
                break
            }
            }
        
        stLabel.text = "\(persona!.stats[0])"
        maLabel.text = "\(persona!.stats[1])"
        enLabel.text = "\(persona!.stats[2])"
        agLabel.text = "\(persona!.stats[3])"
        luLabel.text = "\(persona!.stats[4])"
        
        stWhite.frame.size.width = (CGFloat(Float(self.stLabel.text!)!) * 130/99 + 6.25)
        maWhite.frame.size.width = (CGFloat(Float(self.maLabel.text!)!) * 130/99 + 6.25)
        enWhite.frame.size.width = (CGFloat(Float(self.enLabel.text!)!) * 130/99 + 6.25)
        agWhite.frame.size.width = (CGFloat(Float(self.agLabel.text!)!) * 130/99 + 6.25)
        luWhite.frame.size.width = (CGFloat(Float(self.luLabel.text!)!) * 130/99 + 6.25)
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if (physicalLabel.text != nil) {
            physicalLabel.center.y = physicalImage.center.y
            UIView.animate(withDuration: 0.5, animations: {
                self.physicalLabel.center.y += 24
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
        if (gunLabel.text != nil) {
            gunLabel.center.y = gunImage.center.y
            UIView.animate(withDuration: 0.5, animations: {
                self.gunLabel.center.y += 24
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
        if (agiLabel.text != nil) {
            agiLabel.center.y = agiImage.center.y
            UIView.animate(withDuration: 0.5, animations: {
                self.agiLabel.center.y += 24
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
        if (bufuLabel.text != nil) {
            bufuLabel.center.y = bufuImage.center.y
            UIView.animate(withDuration: 0.5, animations: {
                self.bufuLabel.center.y += 24
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
        if (zioLabel.text != nil) {
            zioLabel.center.y = zioImage.center.y
            UIView.animate(withDuration: 0.5, animations: {
                self.zioLabel.center.y += 24
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
        if (garuLabel.text != nil) {
            garuLabel.center.y = garuImage.center.y
            UIView.animate(withDuration: 0.5, animations: {
                self.garuLabel.center.y += 24
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
        if (psyLabel.text != nil) {
            psyLabel.center.y = psyImage.center.y
            UIView.animate(withDuration: 0.5, animations: {
                self.psyLabel.center.y += 24
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
        if (nuclearLabel.text != nil) {
            nuclearLabel.center.y = nuclearImage.center.y
            UIView.animate(withDuration: 0.5, animations: {
                self.nuclearLabel.center.y += 24
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
        if (hamaLabel.text != nil) {
            hamaLabel.center.y = hamaImage.center.y
            UIView.animate(withDuration: 0.5, animations: {
                self.hamaLabel.center.y += 24
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
        if (mudoLabel.text != nil) {
            mudoLabel.center.y = mudoImage.center.y
            UIView.animate(withDuration: 0.5, animations: {
                self.mudoLabel.center.y += 24
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
        
        stBar.frame.size.width = 0
        stBar.center.x = stLabel.center.x + 12.5
        UIView.animate(withDuration: 0.5, animations: {
            self.stBar.frame.size.width += (CGFloat(Float(self.stLabel.text!)!) * 130/99)
            self.view.layoutIfNeeded()
        }, completion: nil)
        maBar.frame.size.width = 0
        maBar.center.x = maLabel.center.x + 12.5
        UIView.animate(withDuration: 0.5, animations: {
            self.maBar.frame.size.width += (CGFloat(Float(self.maLabel.text!)!) * 130/99)
            self.view.layoutIfNeeded()
        }, completion: nil)
        enBar.frame.size.width = 0
        enBar.center.x = enLabel.center.x + 12.5
        UIView.animate(withDuration: 0.5, animations: {
            self.enBar.frame.size.width += (CGFloat(Float(self.enLabel.text!)!) * 130/99)
            self.view.layoutIfNeeded()
        }, completion: nil)
        agBar.frame.size.width = 0
        agBar.center.x = agLabel.center.x + 12.5
        UIView.animate(withDuration: 0.5, animations: {
            self.agBar.frame.size.width += (CGFloat(Float(self.agLabel.text!)!) * 130/99)
            self.view.layoutIfNeeded()
        }, completion: nil)
        luBar.frame.size.width = 0
        luBar.center.x = luLabel.center.x + 12.5
        UIView.animate(withDuration: 0.5, animations: {
            self.luBar.frame.size.width += (CGFloat(Float(self.luLabel.text!)!) * 130/99)
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if (physicalLabel.text != nil) {
            UIView.animate(withDuration: 0.5, animations: {
                self.physicalLabel.center.y -= 24
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
        if (gunLabel.text != nil) {
            UIView.animate(withDuration: 0.5, animations: {
                self.gunLabel.center.y -= 24
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
        if (agiLabel.text != nil) {
            UIView.animate(withDuration: 0.5, animations: {
                self.agiLabel.center.y -= 24
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
        if (bufuLabel.text != nil) {
            UIView.animate(withDuration: 0.5, animations: {
                self.bufuLabel.center.y -= 24
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
        if (zioLabel.text != nil) {
            UIView.animate(withDuration: 0.5, animations: {
                self.zioLabel.center.y -= 24
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
        if (garuLabel.text != nil) {
            UIView.animate(withDuration: 0.5, animations: {
                self.garuLabel.center.y -= 24
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
        if (psyLabel.text != nil) {
            UIView.animate(withDuration: 0.5, animations: {
                self.psyLabel.center.y -= 24
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
        if (nuclearLabel.text != nil) {
            UIView.animate(withDuration: 0.5, animations: {
                self.nuclearLabel.center.y -= 24
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
        if (hamaLabel.text != nil) {
            UIView.animate(withDuration: 0.5, animations: {
                self.hamaLabel.center.y -= 24
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
        if (mudoLabel.text != nil) {
            UIView.animate(withDuration: 0.5, animations: {
                self.mudoLabel.center.y -= 24
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
        
        UIView.animate(withDuration: 0.5, animations: {
            self.stBar.frame.size.width -= (CGFloat(Float(self.stLabel.text!)!) * 130/99)
            self.view.layoutIfNeeded()
        }, completion: nil)
        UIView.animate(withDuration: 0.5, animations: {
            self.maBar.frame.size.width -= (CGFloat(Float(self.maLabel.text!)!) * 130/99)
            self.view.layoutIfNeeded()
        }, completion: nil)
        UIView.animate(withDuration: 0.5, animations: {
            self.enBar.frame.size.width -= (CGFloat(Float(self.enLabel.text!)!) * 130/99)
            self.view.layoutIfNeeded()
        }, completion: nil)
        UIView.animate(withDuration: 0.5, animations: {
            self.agBar.frame.size.width -= (CGFloat(Float(self.agLabel.text!)!) * 130/99)
            self.view.layoutIfNeeded()
        }, completion: nil)
        UIView.animate(withDuration: 0.5, animations: {
            self.luBar.frame.size.width -= (CGFloat(Float(self.luLabel.text!)!) * 130/99)
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    func populateElems(_ label: UILabel, _ elem: String) {
        switch elem {
        case "Dr", "Nul", "Rpl", "Str":
            label.textColor = steel
            label.backgroundColor = UIColor.black
            label.text = elem
        case "Wk":
            label.textColor = UIColor.white
            label.backgroundColor = UIColor.black
            label.text = elem
        case "-":
            label.text = nil
        default:
            label.text = nil
        }
    }
    
    func populateSkills(_ image: UIImageView, _ skill: UILabel, _ level: UILabel, _ levelnum: UILabel, _ skillName: String, _ skillLevel: Int) {
        
        skillsList.PhysicalSkills.Phys.SingleTarget.forEach { (currentSkill) in
            if (currentSkill.key.elementsEqual(skillName)) {
                image.image = UIImage.init(named: "Melee_Icon_P5")
            }
        }
        skillsList.PhysicalSkills.Phys.MultiTarget.forEach { (currentSkill) in
            if (currentSkill.key.elementsEqual(skillName)) {
                image.image = UIImage.init(named: "Melee_Icon_P5")
            }
        }
        skillsList.PhysicalSkills.Gun.forEach { (currentSkill) in
            if (currentSkill.key.elementsEqual(skillName)) {
                image.image = UIImage.init(named: "Ranged_Icon_P5")
            }
        }
        skillsList.MagicSkills.Fire.forEach { (currentSkill) in
            if (currentSkill.key.elementsEqual(skillName)) {
                image.image = UIImage.init(named: "Fire_Icon_P5")
            }
        }
        skillsList.MagicSkills.Ice.forEach { (currentSkill) in
            if (currentSkill.key.elementsEqual(skillName)) {
                image.image = UIImage.init(named: "Ice_Icon_P5")
            }
        }
        skillsList.MagicSkills.Electric.forEach { (currentSkill) in
            if (currentSkill.key.elementsEqual(skillName)) {
                image.image = UIImage.init(named: "Elec_Icon_P5")
            }
        }
        skillsList.MagicSkills.Wind.forEach { (currentSkill) in
            if (currentSkill.key.elementsEqual(skillName)) {
                image.image = UIImage.init(named: "Wind_Icon_P5")
            }
        }
        skillsList.MagicSkills.Psychokinesis.forEach { (currentSkill) in
            if (currentSkill.key.elementsEqual(skillName)) {
                image.image = UIImage.init(named: "Psy_Icon_P5")
            }
        }
        skillsList.MagicSkills.Nuclear.forEach { (currentSkill) in
            if (currentSkill.key.elementsEqual(skillName)) {
                image.image = UIImage.init(named: "Nuclear_Icon_P5")
            }
        }
        skillsList.MagicSkills.Bless.forEach { (currentSkill) in
            if (currentSkill.key.elementsEqual(skillName)) {
                image.image = UIImage.init(named: "Light_Icon_P5")
            }
        }
        skillsList.MagicSkills.Curse.forEach { (currentSkill) in
            if (currentSkill.key.elementsEqual(skillName)) {
                image.image = UIImage.init(named: "Dark_Icon_P5")
            }
        }
        skillsList.MagicSkills.Almighty.forEach { (currentSkill) in
            if (currentSkill.key.elementsEqual(skillName)) {
                image.image = UIImage.init(named: "Almighty_Icon_P5")
            }
        }
        skillsList.MagicSkills.Ailment.Physiological.forEach { (currentSkill) in
            if (currentSkill.key.elementsEqual(skillName)) {
                image.image = UIImage.init(named: "Ailment_Icon_P5")
            }
        }
        skillsList.MagicSkills.Ailment.Mental.forEach { (currentSkill) in
            if (currentSkill.key.elementsEqual(skillName)) {
                image.image = UIImage.init(named: "Ailment_Icon_P5")
            }
        }
        skillsList.HealAssistSkills.Healing.forEach { (currentSkill) in
            if (currentSkill.key.elementsEqual(skillName)) {
                image.image = UIImage.init(named: "Healing_Icon_P5")
            }
        }
        skillsList.HealAssistSkills.Support.Negatable.forEach { (currentSkill) in
            if (currentSkill.key.elementsEqual(skillName)) {
                image.image = UIImage.init(named: "Assist_Icon_P5")
            }
        }
        skillsList.HealAssistSkills.Support.NonNegatable.forEach { (currentSkill) in
            if (currentSkill.key.elementsEqual(skillName)) {
                image.image = UIImage.init(named: "Assist_Icon_P5")
            }
        }
        skillsList.HealAssistSkills.Support.Shields.forEach { (currentSkill) in
            if (currentSkill.key.elementsEqual(skillName)) {
                image.image = UIImage.init(named: "Assist_Icon_P5")
            }
        }
        skillsList.HealAssistSkills.Support.Negation.forEach { (currentSkill) in
            if (currentSkill.key.elementsEqual(skillName)) {
                image.image = UIImage.init(named: "Assist_Icon_P5")
            }
        }
        skillsList.PassiveSkills.Counter.forEach { (currentSkill) in
            if (currentSkill.key.elementsEqual(skillName)) {
                image.image = UIImage.init(named: "Nav_Skill_Icon_P5")
            }
        }
        skillsList.PassiveSkills.Offensive.forEach { (currentSkill) in
            if (currentSkill.key.elementsEqual(skillName)) {
                image.image = UIImage.init(named: "Nav_Skill_Icon_P5")
            }
        }
        skillsList.PassiveSkills.Defensive.forEach { (currentSkill) in
            if (currentSkill.key.elementsEqual(skillName)) {
                image.image = UIImage.init(named: "Nav_Skill_Icon_P5")
            }
        }
        skillsList.PassiveSkills.Evasion.forEach { (currentSkill) in
            if (currentSkill.key.elementsEqual(skillName)) {
                image.image = UIImage.init(named: "Nav_Skill_Icon_P5")
            }
        }
        skillsList.PassiveSkills.Recovery.forEach { (currentSkill) in
            if (currentSkill.key.elementsEqual(skillName)) {
                image.image = UIImage.init(named: "Nav_Skill_Icon_P5")
            }
        }
        skillsList.PassiveSkills.OncePerBattle.forEach { (currentSkill) in
            if (currentSkill.key.elementsEqual(skillName)) {
                image.image = UIImage.init(named: "Nav_Skill_Icon_P5")
            }
        }
        skillsList.PassiveSkills.PostBattleEffect.forEach { (currentSkill) in
            if (currentSkill.key.elementsEqual(skillName)) {
                image.image = UIImage.init(named: "Nav_Skill_Icon_P5")
            }
        }
        
        skill.text = skillName
        if (skillLevel != 0) {
            level.text = "LV"
            levelnum.text = "\(skillLevel)"
        }
        skill.isUserInteractionEnabled = true
    }
    
    func loadSkillsList() -> AllSkills {
        let path = Bundle.main.path(forResource: "skills", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        var result: AllSkills?
        do {
            let data = try Data(contentsOf: url)
            
            result = try JSONDecoder().decode(AllSkills.self, from: data)
            
        }
        catch {
            print("Error loading json, rip")
            print(error)
            result = nil
        }
        
        return result!
    }
}
