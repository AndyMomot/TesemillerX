//
//  ProfileViewModel.swift
//  TesemiliX
//
//  Created by Andrii Momot on 04.06.2024.
//

import Foundation
import SwiftUI

extension ProfileView {
    final class ProfileViewModel: ObservableObject {
        @Published var profile: HomeView.HomeViewModel.Profile = .init(
            firstName: "",
            lastName: "",
            isUser: true
        )
        @Published var amount: Double = .zero
        @Published var showCreatePerson = false
        @Published var showAdviceDetails = false
        
        var adviceToShow = Advice(previewImage: "", mainImage: "", title: "", text: "")
        
        var advices: [Advice] = [
            .init(previewImage: "Rectangle29",
                  mainImage: "Rectangle34",
                  title: "Zakup domu",
                  text: """
                        •    Ustal budżet: Określ ile możesz miesięcznie przeznaczyć na oszczędności na dom.
                        
                        •    Stwórz plan oszczędności: Wyznacz cel i rozłóż kwotę na mniejsze, łatwiejsze do osiągnięcia cele.
                        
                        •    Rozważ dodatkowe źródła dochodu: Znajdź sposoby na zwiększenie swoich oszczędności, np. praca dodatkowa lub sprzedanie niepotrzebnych rzeczy.
                        
                        •    Porównaj oferty kredytów hipotecznych: Znajdź najkorzystniejszy kredyt hipoteczny, aby obniżyć koszty zakupu domu.
                        
                        •    Znajdź niedrogie opcje mieszkaniowe: Zapoznaj się z różnymi rodzajami mieszkań, takimi jak apartamenty, kamienice i domy w okolicy, aby znaleźć coś, co odpowiada Twoim potrzebom i budżetowi.
                        
                        •    Zmniejszenie kosztów napraw: Naucz się podstawowych umiejętności naprawczych, abyś mógł samodzielnie wykonywać drobne naprawy i zaoszczędzić pieniądze na zatrudnianiu złotej rączki.
                        
                        •    Zainwestuj w efektywność energetyczną: Uczyń swój dom bardziej energooszczędnym, aby obniżyć rachunki za media. Może to obejmować środki takie jak izolacja, wymiana okien i drzwi oraz instalacja energooszczędnych urządzeń.
                        
                        •    Poszukaj programów rządowych: Dowiedz się o programach rządowych, które mogą pomóc w zakupie lub wynajmie domu, takich jak dotacje lub ulgi podatkowe.
                        """),
            
                .init(previewImage: "Rectangle30",
                      mainImage: "Rectangle35",
                      title: "Zakup samochódu",
                      text: """
                      •    Określ swoje potrzeby: Zastanów się jaki typ samochodu potrzebujesz i ile jesteś w stanie za niego zapłacić.
                      
                      •    Oszczędzaj na zaliczkę: Zaliczka ułatwi Ci uzyskanie kredytu samochodowego na lepszych warunkach.
                      
                      •    Porównaj oferty ubezpieczeń: Znajdź najtańsze i najlepsze ubezpieczenie OC i AC dla swojego samochodu.
                      
                      •    Zadbaj o regularną konserwację: Regularne przeglądy i serwisowanie samochodu pozwolą Ci uniknąć kosztownych awarii.
                      
                      •    Rozważ alternatywne opcje transportu: Zamiast kupować nowy samochód, rozważ zakup używanego samochodu lub wynajem samochodu, gdy naprawdę go potrzebujesz. Możesz także korzystać z transportu publicznego, roweru lub chodzić pieszo, aby zaoszczędzić na kosztach transportu.
                      
                      •    Obniż koszty ubezpieczenia: Porównaj oferty różnych firm ubezpieczeniowych, aby znaleźć najlepszą ofertę dla siebie. Zwiększ udział własny, aby zmniejszyć miesięczne płatności, ale pamiętaj, że będziesz musiał zapłacić więcej w razie wypadku.
                      
                      •    Jedź ekonomicznie: Przestrzegaj zasad oszczędnej jazdy, aby obniżyć koszty paliwa. Może to obejmować płynną jazdę, utrzymywanie optymalnej prędkości i regularne serwisowanie samochodu.
                      
                      •    Sprzedaj stary samochód: Jeśli masz stary samochód, którego nie używasz, sprzedaj go, aby uzyskać dodatkową gotówkę do swoich oszczędności.
                      """),
            
                .init(previewImage: "Rectangle31",
                      mainImage: "Rectangle36",
                      title: "Szkolenie",
                      text: """
                        •    Ustal koszty nauki: Określ jakie są koszty czesnego, materiałów edukacyjnych i innych wydatków związanych z nauką.
                    
                        •    Stwórz plan oszczędności: Rozłóż kwotę na mniejsze raty i oszczędzaj systematycznie.
                    
                        •    Rozważ stypendia i dofinansowania: Poszukaj możliwości uzyskania stypendiów lub dofinansowań, które pomogą Ci pokryć koszty nauki.
                    
                        •    Znajdź pracę dorywczą: Praca dorywcza może być dobrym sposobem na dodatkowe oszczędności na naukę.
                    
                        •    Poszukaj kursów i programów online: Kursy i programy online mogą być bardziej przystępne cenowo niż tradycyjne programy stacjonarne.
                    
                        •    Korzystaj z bezpłatnych zasobów edukacyjnych: Istnieje wiele bezpłatnych zasobów edukacyjnych dostępnych online, takich jak wykłady, artykuły i e-booki.
                    
                        •    Weź udział w programie wymiany studenckiej: Programy wymiany studenckiej umożliwiają studiowanie za granicą po niższych kosztach niż we własnym kraju.
                    
                        •    Znajdź pracę, która oferuje pomoc w nauce: Niektóre firmy oferują swoim pracownikom korzyści, takie jak zwrot kosztów czesnego lub elastyczne godziny pracy, abyś mógł studiować.
                    """),
            
                .init(previewImage: "Rectangle32",
                      mainImage: "Rectangle33",
                      title: "Podróżowanie",
                      text: """
                        •    Określ swój budżet: Zastanów się ile możesz przeznaczyć na podróż i na jak długo chcesz wyjechać.
                      
                        •    Wybierz kierunek: Wybierz kierunek podróży, który odpowiada Twoim zainteresowaniom i budżetowi.
                      
                        •    Rezerwuj bilety i noclegi z wyprzedzeniem: Rezerwując z wyprzedzeniem możesz uzyskać lepsze ceny.
                      
                        •    Zaplanuj swój pobyt: Zaplanuj co chcesz zobaczyć i zrobić podczas podróży, aby jak najlepiej wykorzystać czas.
                      
                        •    Podróżowanie z przyjaciółmi lub rodziną: Podróżowanie z przyjaciółmi lub rodziną może pomóc w dzieleniu kosztów zakwaterowania, transportu i rozrywki.
                      
                        •    Korzystanie z aplikacji do współdzielenia domu: Programy typu home-sharing umożliwiają zamieszkanie w domu lokalnej osoby za darmo lub za niewielką opłatą.
                      
                        •    Wolontariat w zamian za zakwaterowanie: Istnieje wiele organizacji oferujących programy wolontariatu, w ramach których możesz zostać wolontariuszem w zamian za pokój i wyżywienie.
                      
                        •    Poszukaj darmowej rozrywki: Wiele miast oferuje bezpłatną rozrywkę, taką jak muzea z bezpłatnym wstępem, parki i festiwale.
                      """)
        ]
        
        func getProfile() {
            if let userProfile = DefaultsService.getProfiles().first(where: { $0.isUser }) {
                profile = userProfile
            }
        }
        
        func getProfileImage() -> Image {
            let id = profile.id
            let path = FileManagerService.Keys.profileImage(id: id).path
            guard let data = FileManagerService().getFile(forPath: path),
                  let uiImage = UIImage(data: data)
            else {
                return .init(systemName: "person.circle.fill")
            }
            
            return Image(uiImage: uiImage)
        }
        
        func getAmount() {
            let budgets = DefaultsService.getBudgets().filter {
                $0.contributions.contains(where: { $0.profile.isUser })
            }
            
            amount = budgets.reduce(0.0) { $0 + $1.amount }
        }
    }
}

extension ProfileView.ProfileViewModel {
    struct Advice: Identifiable, Hashable {
        private(set) var id = UUID().uuidString
        var previewImage: String
        var mainImage: String
        var title: String
        var text: String
    }
}
