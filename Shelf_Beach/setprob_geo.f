c=========================================================================
      subroutine setprob
c=========================================================================

      use geoclaw_module
      use topo_module
      use dtopo_module

      implicit double precision (a-h,o-z)
      real (kind=8) :: mu
      common /wave/ profile(202,8)
      dimension aux(1,1,1)

      call set_geo          !# sets basic parameters g and coord system
      call set_tsunami      !# sets parameters specific to tsunamis
      call set_topo         !# specifies topography (bathymetry) files
      call set_dtopo        !# specifies file with dtopo from earthquake
      call setqinit         !# specifies file with dh if this used instead
      call setregions       !# specifies where refinement is allowed/forced
      call setgauges        !# locations of measuring gauges
      call setfixedgrids    !# specifies output on arbitrary uniform fixed grids

      t_init = 0.0          !# Initial time to specify waveform
      t_fin = 100.0         !# Final time to specify waveform
      dt = (t_fin-t_init)/202!# Timestep
      h = 2.0               !# Wave Amplitude
      sigma = 5.0           !# Standard Deviation of gaussian waveform
      mu = 10.0
 
      do it = 1,202
         profile(it,1) = it*dt 
         profile(it,2) = 100.0!# h*exp(-(profile(it,1)-mu)**2/sigma**2)+0
      end do
c      open(unit=76,file='../ts3c.txt',status='old',
c     &     form='formatted')      

c      do it=1,202 !this only reads in the first 10 seconds of data
c         read(76,*) profile(it,1),profile(it,2),profile(it,3),
c     &    profile(it,4), profile(it,5),profile(it,6),profile(it,7),
c     &    profile(it,8)
c      enddo
      
      !Shift time of BC and scale amplitude
c      do it = 1,202
c            profile(it,1) = profile(it,1)-265.05 !this is time in seconds
c            profile(it,2) = profile(it,2)*1.0e0+0.218!this is amplitude in meters 
c      end do 
      

c      close(unit=76)

      return
      end
