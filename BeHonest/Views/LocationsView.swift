//
//  LocationsView.swift
//  BeHonest
//
//  Created by Arshia Prince on 4/14/23.
//

import SwiftUI

struct LocationsView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    
    var body: some View {
        List{
            ForEach(vm.locations){ location in
                Text(location.name)
            }
        }
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView().environmentObject(LocationsViewModel())
    }
}
