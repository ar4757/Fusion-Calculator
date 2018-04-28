//
//  PersonaStatsViewController.swift
//  Fusion Calculator
//
//  Created by Andrew Ratz on 3/28/18.
//  Copyright © 2018 Andrew Ratz. All rights reserved.
//

import UIKit

class PersonaStatsViewController: UIViewController {
    
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
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    var pageNumber: Int!
    var persona: Persona?
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        personaImage.image = UIImage.init(named: name!)
        
        nameLabel.text = name
        
        let strokeTextAttributes: [NSAttributedStringKey : Any] =
            [NSAttributedStringKey.strokeColor : UIColor.white, NSAttributedStringKey.foregroundColor : UIColor.black, NSAttributedStringKey.strokeWidth : -4.0,]
        arcanaLabel.attributedText = NSAttributedString(string: persona!.arcana, attributes: strokeTextAttributes)
        
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
        image.image = UIImage.init(named: "Ailment_Icon_P5")
        skill.text = skillName
        if (skillLevel != 0) {
            level.text = "LV"
            levelnum.text = "\(skillLevel)"
        }
    }
}
