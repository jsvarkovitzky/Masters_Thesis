

c     =====================================================
       subroutine qinit(maxmx,maxmy,meqn,mbc,mx,my,xlower,ylower,
     &                   dx,dy,q,maux,aux)
c     =====================================================
c
c      # Set initial sea level flat unless iqinit = 1, in which case
c      # an initial perturbation of the q(i,j,1) is specified and has
c      # been strored in qinitwork.


       implicit double precision (a-h,o-z)
       double precision mu, sigma
       dimension q(1-mbc:maxmx+mbc, 1-mbc:maxmy+mbc, meqn)
       dimension aux(1-mbc:maxmx+mbc,1-mbc:maxmy+mbc,maux)


       hmax = 0.0185d0
       gamma = dsqrt(0.75d0*hmax)
       xs = 22.d0
       mu = 50000
       sigma = 5000
       do i=1-mbc,mx+mbc
          x = xlower + (i-0.5d0)*dx
          do j=1-mbc,my+mbc
             q(i,j,1) = dexp(-(x-mu)**2/sigma**2)-aux(i,j,1) 
             q(i,j,2) = dsqrt(9.8*dsqrt((q(i,j,1)+aux(i,j,1))**2))
             q(i,j,3) = 0.0d0
             enddo
          enddo


       return
       end
